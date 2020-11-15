## 交互协议理解

本教程将向您介绍攻击板和目标板的通信协议系统。它将向您展示如何根据软件的输入对数据执行不同的操作。
您可以使用这套通信协议构建您自己的用于“破解”的目标板系统。

## SimpleSerial 通信协议

![simple_serial](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp4muhuj31hs0u0444.jpg)

SimpleSerial 是几乎所有演示项目使用的通信协议。这是一个非常基本的串行协议，可以在大多数系统上轻松实现。
该协议使用标准的异步串行协议进行通信，波特率为 38400，8-N-1。
所有消息都以 ASCII 文本发送，通常以换行符（'\n'）终止。这允许您通过标准终端仿真器与 simpleserial 系统进行交互。

`x`

> 发送'x'会重置缓冲区。这个操作不需要换行终止。我们建议始终发送一串 x 数据流以初始化系统，以防设备因噪声/损坏而处于某种其他模式。

`k00112233445566778899AABBCCDDEEFF\n`

> 将加密密钥`00112233445566778899AABBCCDDEEFF`加载到系统中。 如果没有调用，系统可能会使用默认密钥。

`pAABBCCDDEEFF00112233445566778899\n`

> 传递明文数据`AABBCCDDEEFF00112233445566778899`，并使用上文中'k'命令加载的密钥进行加密操作。系统将使用以 r 开头的字符串进行响应，如下所示。

`rCBBD4A2B34F2571758FF6A797E09859D\n`

> 这是系统的响应。 例如，我们将明文通过'p'发送给目标系统后，系统会进行加密操作，然后将自动回复'r'序列作为响应。 所以发送前面的例子意味着加密的结果是`cbbd4a2b34f2571758ff6a797e09859d`。

## 构建基本例子

为了构建基本的示例，您需要为目标板配置适当的编译器。需要安装`avr-gcc`和`avr-libc`。如果您使用的是具有不同体系结构的目标板，则需要安装相关的交叉编译环境，本文指代板子上的目标板。如果您不确定，可以运行以下代码块。如果您安装了正确的软件，您应该会看到相关编译器打印的版本和版权信息：

```bash
#check for avr-gcc
avr-gcc --version

#check for ARM gcc
arm-none-eabi-gcc --version
```

现在您已经为目标板安装了相关的交叉编译工具链，应该能够为所需的硬件平台构建相应的固件。下面我们首先创建一个基于 simpleserial-base 的新项目，具体方法如下所示：创建一个新的固件并从我们想要处理的项目中复制文件：

```bash
cd ../../hardware/victims/firmware/
mkdir -p simpleserial-base-lab1 && cp -r simpleserial-base/* $_
cd simpleserial-base-lab1

make PLATFORM=$1 CRYPTO_TARGET=$2
```

接下来我们需要修改系统以对数据执行一些操作，这样我们就可以确认整个系统是否正常工作。为此，使用代码编辑器（如 vscode）在 simpleserial-base-lab1 文件夹中打开文件`simpleserial-base.c`。

在文件末尾找到以下代码块：

```C
/**********************************
 * Start user-specific code here. */
trigger_high();

//16 hex bytes held in 'pt' were sent
//from the computer. Store your response
//back into 'pt', which will send 16 bytes
//back to computer. Can ignore of course if
//not needed

trigger_low();
/* End user-specific code here. *
```

修改它以增加每个字节数据的值：

```C
/**********************************
 * Start user-specific code here. */
trigger_high();

//16 hex bytes held in 'pt' were sent
//from the computer. Store your response
//back into 'pt', which will send 16 bytes
//back to computer. Can ignore of course if
//not needed

for(int i = 0; i < 16; i++){
    pt[i]++;
}

trigger_low();
/* End user-specific code here. *
 ********************************/
```

然后使用`make`重新编译文件：
