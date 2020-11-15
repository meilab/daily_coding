数字硬件设备需要某种形式的可靠时钟才能正常工作。我们可以操纵提供给设备的时钟从而使得设备的执行错乱。我们在这里将专注于微控制器，但是其他数字设备（例如硬件加密加速器）也可能使用这种技术注入故障。

芯片并不会从 Flash 加载所有的指令然后整体执行这些指令，而是具有一个流水线来加速执行过程。这意味着系统在解码一条指令时，同时会去读取下一条命令，如下图所示：

![A2_2](https://wiki.newae.com/images/a/a5/Clock-normal.png)

但是如果我们修改时钟，我们可能会遇到系统没有足够时间实际执行指令的情况。请考虑下面的内容，其中对于＃1 的执行将被跳过。在系统有时间实际执行某条指令之前，另一个时钟沿到来，导致微控制器直接开始执行下一条指令：

![A2_3](https://wiki.newae.com/images/1/1e/Clock-glitched.png)

这导致微控制器跳过指令执行。这种攻击在实践中可以非常强大。例如，考虑来自`linux-util-2.24`的以下代码：

```C
/*
 *   auth.c -- PAM authorization code, common between chsh and chfn
 *   (c) 2012 by Cody Maloney <cmaloney@theoreticalchaos.com>
 *
 *   this program is free software.  you can redistribute it and
 *   modify it under the terms of the gnu general public license.
 *   there is no warranty.
 *
 */

#include "auth.h"
#include "pamfail.h"

int auth_pam(const char *service_name, uid_t uid, const char *username)
{
    if (uid != 0) {
        pam_handle_t *pamh = NULL;
        struct pam_conv conv = { misc_conv, NULL };
        int retcode;

        retcode = pam_start(service_name, username, &conv, &pamh);
        if (pam_fail_check(pamh, retcode))
            return FALSE;

        retcode = pam_authenticate(pamh, 0);
        if (pam_fail_check(pamh, retcode))
            return FALSE;

        retcode = pam_acct_mgmt(pamh, 0);
        if (retcode == PAM_NEW_AUTHTOK_REQD)
            retcode =
                pam_chauthtok(pamh, PAM_CHANGE_EXPIRED_AUTHTOK);
        if (pam_fail_check(pamh, retcode))
            return FALSE;

        retcode = pam_setcred(pamh, 0);
        if (pam_fail_check(pamh, retcode))
            return FALSE;

        pam_end(pamh, 0);
        /* no need to establish a session; this isn't a
         * session-oriented activity...  */
    }
    return TRUE;
}
```

这是 Linux 操作系统的登录代码。请注意，如果我们可以跳过检查`if (uid！= 0)`并简单地跳转到最后，我们可以避免输入密码就能进入系统。这是 Glitch 攻击的威力 - 不是我们攻破加密，而是简单的绕过整个身份验证模块！

### 设置目标板固件

与之前的实验一样，我们首先从基础固件创建一个新项目。 本实验不使用任何加密。 这一次，我们将使用`glitch-simple`：

```bash
%%bash
cd ../../hardware/victims/firmware/
mkdir -p glitch-simple-lab1 && cp -r glitch-simple/* $_
```

现在导航到`glitch-simple-lab1`文件夹并在代码编辑器中打开`glitchsimple.c`。 向下滚动，直到找到`glitch1（）`函数：

```C
void glitch1(void)
{
    led_ok(1);
    led_error(0);

    //Some fake variable
    volatile uint8_t a = 0;

    putch('A');

    //External trigger logic
    trigger_high();
    trigger_low();

    //Should be an infinite loop
    while(a != 2){
    ;
    }

    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);

    uart_puts("1234");

    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);
    led_error(1);

    //Several loops in order to try and prevent restarting
    while(1){
    ;
    }
    while(1){
    ;
    }
    while(1){
    ;
    }
    while(1){
    ;
    }
    while(1){
    ;
    }
}

```

我们可以在这里看到发送回字符`'A'`，切换触发引脚，然后进入无限循环。在无限循环之后，设备发回字符串`“1234”`。在支持它的电路板上，固件还将在进入此功能时点亮绿色 LED，并在发生成功 Glitch 时激活红色“ERROR”LED。我们的目标是跳出无限循环。

在构建之前，导航到`main()`并验证是否正在调用此函数。接下来，构建固件：

```bash
make
```

现在让我们确保固件工作正常。重置目标板后我们应该收到回复`hello\nA`。

### 设置 Glitch 攻击

将软件设置为 Glitch 模式，并配置 trigger，src 等参数。

![0-5-4-Glitch设置1](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp7y96sj31c00u0wmf.jpg)

![0-5-4-Glitch设置2](https://tva1.sinaimg.cn/large/007S8ZIlly1gjekp558pnj31c00u0n3y.jp)

现在设置完成并且我们已经知道如何使用 glitch 模块，我们可以开始进行攻击。我们需要迭代修改的关键参数是`width`和`offset`，所以我们需要一些循环来改变它们。 我们将在输出中检查“1234”来确定我们是否成功的进行了 glitch 攻击。

可以有一些改进空间：修改每个参数并多次尝试 glitch，并跟踪成功率。

运气好的话，你会有一些成功的 glitch 攻击。创建一个较小范围的 offsets(偏移)和 widths(宽度)，在这个范围里能够找到大多数成功的 glitch。这将极大地加速未来的攻击（请确保不会将范围限定的太小，因为您可能会错过某些攻击的成功设置）。例如，您可能已经发现大多数 glitch 在宽度`[-9，-5]`和偏移量为`[-37，-40]`之间，因此良好的范围可能是`[-10，-4]`和`[-35，-41]`。

如果你没有得到任何成功的 glitch，请注意我们只使用了`[-10,10]`或`[-49，-30]`的`offset`（最大值是`[-50,50]` ）。尝试使用更大范围的 offsets(偏移)来查看成功 offset(偏移)是否超出此范围。

如果你想将这个攻击更进一步，可以尝试将`repeat`减少到 1 并迭代`ext_offset`来寻找 glitch 成功的精确时钟周期。为了节省时间，选择适合你的`width`和`offset`，只改变`ext_offset`。请注意，即使使用正确的参数和位置，插入 glitch 并不总能有效，因此更好的策略可能是在`ext_offset`值上无限循环，直到您获得成功的 glitch。

**提示：我们在 XMEGA 上使用的`repeat`为 105 来进行此攻击（并且`ext_offset`为 0），这在前 105 个时钟周期的每一个中都会出现 glitch。这意味着针对该目标板的`ext_offset`必须在`[0,105]`范围内。**

### 习题：密码检查 Glitch

目前有应该有参数能够导致半可靠的 glitch，我们可以看一个更具挑战性的例子：密码检查。 回到`glitchsimple.c`并找到`glitch3（）`函数：

```C
void glitch3(void)
{
    char inp[16];
    char c = 'A';
    unsigned char cnt = 0;
    uart_puts("Password:");

    while((c != '\n') & (cnt < 16)){
        c = getch();
        inp[cnt] = c;
        cnt++;
    }

    char passwd[] = "touch";
    char passok = 1;

    trigger_high();
    trigger_low();

    //Simple test - doesn't check for too-long password!
    for(cnt = 0; cnt < 5; cnt++){
        if (inp[cnt] != passwd[cnt]){
            passok = 0;
        }
    }

    if (!passok){
        uart_puts("Denied\n");
    } else {
        uart_puts("Welcome\n");
    }
}
```

正如您所料，我们将尝试通过 glitch 攻击让代码跳过`if（！passok）`检查，直接到结尾部分。 更改`main()`以调用`glitch3()`（运行下面的块将执行此操作）。像以前一样，我们将构建和烧写新固件。
