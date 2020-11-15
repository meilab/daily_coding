大家学习编程的第一个程序应该是 Hello World，但是你的 Hello World 完整吗？

很多新手的 Hello World 程序会写成下面这样。

```c
#include <stdio.h>

main() {
  printf("hello world");
}
```

这里有两个问题：

- 打印之后没有换行，所以结果看起来怪怪的
- main 函数没有声明返回类型，所以默认是整型。大多数 C 语言实现都是通过 main 函数的返回值告知操作系统执行的是成功还是失败。一般来说 0 代表成功，非 0 代表失败。因为这个 main 函数没有返回任何值，所以有可能看上去执行失败。如果调用我们这个 main 函数的管理系统关注程序执行的成功还是失败，就会得到错误的结果。所以我们的 main 函数应该返回 0.

```c
#include <stdio.h>

main() {
    printf("hello world\n");
    return 0;
  exit(0);
}
```
