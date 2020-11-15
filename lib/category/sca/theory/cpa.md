## 讲解步骤

- 算法攻击位置的选取
- 被处理数据的 Hw 与电压(能量)的大小相关性
- 相关性的度量：相关系数
- CPA 攻击过程
  - 单字节的攻击过程
  - 两个问题
  - 完整攻击过程
  - 样本量

### CPA 基本思想

#### 算法攻击位置的选取

下图给出了 AES 加密的结构，侧信道攻击的攻击点需要选在密钥作用之后，对于 AES 的侧信道攻击，攻击点一般是选在 S 盒之后或列混淆之后。此处，CPA 的攻击点在 S 盒之后

![image-20201005174816838](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97j73qwj30us0t6ju1.jpg)

![image-20201006064208130](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97fs1skj30fc0badg5.jpg)

####被处理数据的汉明重量(HW)与电压(能量)值之间的相关性

下图给出了攻击点具有不同的汉明重量(HW)时，对应的能量迹(Trace)，可以看出：在采样点 416 处

- Hw 越大，对应的电压(能量)越小；
- 随着 Hw 的增加，电压值是近似等间隔地减少

![hw_and_power](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97g88sfj310m0kudhq.jpg)

我们取出峰值处的九个点，就可以给出“汉明重量 Hw 和电压值之间关系的散点图”

![image-20201006064907955](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97effydj30d60avdg5.jpg)

从汉明重量 Hw 和电压值之间关系的散点图可以看出汉明重量 Hw 和电压呈线性相关，如果把 Hw 和电压分别看作两个随机变量 H 和 V，自然而然地就会想到“相关系数”。
其中最常用的是 Pearson 相关系数，它用于刻画两个随机变量之间线性关系的程度。因此，Pearson 相关系数很适合去衡量 Hw--H 和 电压--V 之间的线性关系。其中 Zh 是随机变量 H 标准化后的结果。

![image-20201006065135016](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97go6jhj309e05kt8t.jpg)

##### Pearson 相关系数

![image-20201006065159439](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97eswhtj30jg04674g.jpg)

![image-20201006065213017](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97h9tm6j30ag04amx4.jpg)

#### 具体的 CPA 攻击过程

##### 第一步

随机选择明文字节 p1, ... , pN，输入到目标密码算法执行单元， 采集加密过程中的能量迹：电压 V。需要注意的是：能量迹是在正确密钥下，不同明文在加密过程中泄漏的信息。

我们取出同一采样点处能量迹（下图中绿线处的 N 个点）作为变量 V 的 N 个样本值。这也导出第一个问题：哪个采样点才是执行 S 盒输出（也就是在途中绿线处）？

![step1](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97i2nhoj309g0ajt9b.jpg)

##### 第二步

猜测密钥 K，计算出各明文在此密钥下的 S 盒输出，得到 H 的 N 个样本值（即不同的猜测密钥下，有不同的样本值）

![step2](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97hn488j30ac07ct92.jpg)

##### 第三步

计算 V 和 H 的相关系数。

这里存在着另一问题：正确的密钥和错误的密钥是否可以使得 r(h, v)有区分性？

##### 问题 1：哪个采样点才是执行 S 盒输出

下图中，各子图给出 在正确密钥下，不同采样点位置的电压值与 Hw 之间的散点图。
根据原理，接近 Sbox 输出位置的电压值与 Hw 有较好的线性关系，而在 Sbox 输出的点上有最佳的线性关系(图中 416 点)
因此反过来可以推测，相关系数最大的处应该就是 Sbox 输出的位置。

![sbox_output](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97iqm3bj31ee0niacc.jpg)

##### 问题 2：正确密钥和错误密钥对应相关系数是否具有区分性

下图给出在猜测密钥是正确的情况下，不同采样点位置的电压值与 Hw 之间的相关系数，有明显的尖峰，且尖峰值较大

![correct_key](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97jir3kj30la0msjsi.jpg)

而下图给出在猜测密钥是错误的情况下，不同采样点位置的电压值与 Hw 之间的相关系数，无明显尖峰，且相关系数值都较小。

![wrong_key](https://tva1.sinaimg.cn/large/007S8ZIlly1gjf97fgwvbj30kw0mswh5.jpg)

上面两图具有明显的差别，因而可以用于区分猜测的密钥是否正确。
所以我们并不用去找什么攻击点何时被执行，而是全部位置都做相关系数，找到最大值时，正确的密钥也就找到了，而且 Sbox 的输出位置也找到了。

因此我们就可以整理出个攻击流程：

- 随机选择明文 P1, ... , PN, 采集加密过程中的能量迹: 电压 v, 每条能量迹有 M 个采样点
- 伪码如下：

```matlab
for byte = 1:16
    for k = 0:255
        H = HammingWeight(Sbox(Pbyte k))  //Pbyte:各Pn的第byte个字节
            for m = 1:M
                V = vm  // vm:各能量迹v的第m个采样点
                Corr(k) = r(V, H)
    rightkeybyte = find(max{Corr})
```

#### 关于样本量 N

样本量 N 需要较大（N>30)的原因有两个：

- 相关系数的计算使用的是攻击点 y 的 Hw, 舍弃了大部分关于 y 的信息量
- 存在噪声，噪声越大，N 也越大
