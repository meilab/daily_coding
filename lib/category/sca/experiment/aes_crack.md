参数设置：

- 硬件工作模式：侧信道攻击
- 明文：随机明文
- 采集轮数：50
- 重复次数：1
- 采集点数：3000.

需要注意的是这里的重复次数指的是每个随机明文进行多少次 trace 采集。假设轮数是 50，重复次数是 10，那么总共进行 500 次 trace 采集。

明文模式可以选择固定明文（始终使用相同的明文），随机明文，文件（从文件中读取明文，JSON 格式）

下面代码是从文件中读取明文的示例。value 代表明文的值，round 代表这个明文抓取多少次 trace。

```json
[
  {
    "value": "2b 7e 15 16 28 ae d2 a6 ab f7 15 88 9 cf 4f 3c",
    "round": 2
  },
  {
    "value": "4b 7e 15 16 28 ae d2 a6 ab f7 15 88 9 cf 4f 3c",
    "round": 2
  },
  {
    "value": "3b 7e 15 16 28 ae d2 a6 ab f7 15 88 9 cf 4f 3c",
    "round": 3
  },
  {
    "value": "01 23 45 67 89 AB CD EF FE DC BA 98 76 54 32 10",
    "round": 10
  }
]
```

参数都配置好之后，使用软件连接 USB，和攻击板进行连接，然后进行 trace 抓取。等待 trace 抓取结束之后，可以选择进行侧信道攻击。

#### 连接 USB

![1-通过USB连接设备](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp3zzc4j31c00u0djb.jpg)

#### 参数设置

![0-5-设置](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp6mx7ej31c00u0n0p.jpg)

![0-5-3-侧信道设置1](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp3sbr0j31c00u0jy5.jpg)

![0-5-3-侧信道设置2](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp72ev8j31c00u00zu.jpg)

#### 抓取 trace

![1-1连接上之后的按钮状态](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp5mv8aj31c00u00w1.jpg)

![2-1-抓取trace](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp8f3ytj31c00u0wjb.jpg)

#### CPA 分析

trace 抓取完成之后进行 CPA 分析

![2-3-CPA分析](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp9sfenj31c00u0teg.jpg)

![2-4-CPA分析结果](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp9bxyvj31c00u0jxp.jpg)

#### 修改参数

可以通过快捷方式修改常用参数

![2-6-增加trace轮数](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp8y4qij31c00u010o.jpg)

#### 存储 trace

![2-5-存储trace](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp6358qj31c00u0age.jpg)

#### 断开连接

![2-11-断开设备](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp7ii69j31c00u0n3g.jpg)
