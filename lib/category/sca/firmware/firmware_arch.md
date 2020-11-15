目标板固件分成 3 部分

- avrcryptolib：crypto/avrcryptolib
- 简单串口协议：simpleserial
- 应用代码：simpleserial-aes 等文件夹

固件代码采用 avrcryptolib 作为加解密的底层库。avrcryptolib 是针对 8 位单片机编写的密码库，针对资源受限（CPU 主频低，内存小）的物联网系统进行了相关的优化。我们常用的加密算法都已经实现了，比如 AES，DES，RSA 等

simpleserial 文件夹包含了攻击板和目标板进行交互的简单串口协议的实现。目标板的固件应用程序需要使用相关函数从攻击板获取明文，密钥等参数，进行相关加密运算，然后将加密结果返回给攻击板。

simpleserial-aes 等文件夹是真实的目标板固件应用程序，比如 simpleserial-aes 是目标板实现 AES 加密。

#### simpleserial 协议

代码的核心是 ss_cmd 结构体和 commands 全局变量。commands 对应于我们需要支持的简单串口协议的几个命令（传输明文，密钥，复位等），ss_cmd 记录了 commands 中收到每种命令对应的操作。其中的 c 表征收到的命令，可以是 k，p 等，len 代表长度，fp 是函数指针，表征了收到相应命令后进行的操作。

```c
typedef struct ss_cmd
{
	char c;
	unsigned int len;
	uint8_t (*fp)(uint8_t*);
} ss_cmd;

static ss_cmd commands[MAX_SS_CMDS];
```

固件应用程序开始后，需要调用 simpleserial_addcmd 函数，注册各个简单串口协议命令对应的处理函数。在 simpleserial_addcmd 中会将相关信息存储到全局变量 commands 中，供后续使用。

```c
int simpleserial_addcmd(char c, unsigned int len, uint8_t (*fp)(uint8_t*))
{
	if(num_commands >= MAX_SS_CMDS)
		return 1;

	if(len >= MAX_SS_LEN)
		return 1;

	commands[num_commands].c   = c;
	commands[num_commands].len = len;
	commands[num_commands].fp  = fp;
	num_commands++;

	return 0;
}
```

simpleserial_get 函数会从串口读取数据，查询 commands 全局变量，看看是否收到了我们之前注册的命令，比如

k，p 等。如果收到了注册的命令，则调用其处理函数对数据进行相应的操作。

```c
void simpleserial_get(void)
{
	char ascii_buf[2*MAX_SS_LEN];
	uint8_t data_buf[MAX_SS_LEN];
	char c;

	// Find which command we're receiving
	c = getch();

	int cmd;
	for(cmd = 0; cmd < num_commands; cmd++)
	{
		if(commands[cmd].c == c)
			break;
	}

	// If we didn't find a match, give up right away
	if(cmd == num_commands)
		return;

	// Receive characters until we fill the ASCII buffer
	for(int i = 0; i < 2*commands[cmd].len; i++)
	{
		c = getch();

		// Check for early \n
		if(c == '\n' || c == '\r')
			return;

		ascii_buf[i] = c;
	}

	// Assert that last character is \n or \r
	c = getch();
	if(c != '\n' && c != '\r')
		return;

	// ASCII buffer is full: convert to bytes
	// Check for illegal characters here
	if(hex_decode(commands[cmd].len, ascii_buf, data_buf))
		return;

	// Callback
	uint8_t ret[1];
	ret[0] = commands[cmd].fp(data_buf);

	// Acknowledge (if version is 1.1)
#if SS_VER == SS_VER_1_1
	simpleserial_put('z', 1, ret);
#endif
}
```

#### AES 固件举例

从下面代码中，我们可以看出，固件程序首先对平台进行初始化，然后初始化 UART 串口，AES 算法等。初始化完成之后，我们注册相应的 commands，当我们收到明文时，调用 get_key 函数，收到密钥时，调用 get_pt。在 get_key 和 get_pt 中，我们会调用 avrcryptolib 相应的 AES 实现。注册完 commands 之后，我们会进入 while（1）循环，一直读取攻击板发送给我们的指令，进行相关的操作。

```c
int main(void)
{
	uint8_t tmp[KEY_LENGTH] = {DEFAULT_KEY};

    platform_init();
    init_uart();
    trigger_setup();

	  aes_indep_init();
	  aes_indep_key(tmp);

  	simpleserial_init();
    simpleserial_addcmd('k', 16, get_key);
    simpleserial_addcmd('p', 16,  get_pt);
    simpleserial_addcmd('x',  0,   reset);
    simpleserial_addcmd('m', 18, get_mask);
    while(1)
        simpleserial_get();
}
```

详细的讲解大家可以关注我的 B 站账号“2 郎”或者微信视频号“编程日课-溢出君”看固件的视频教程。

大家可以自己尝试编写 SM4 等加密算法的目标板固件程序，对其进行侧信道攻击。
