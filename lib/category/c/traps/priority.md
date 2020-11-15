假设我们 hi 和 low 是两个整数，它们的值介于 0 到 15 之间，假设 r 是一个 8 位整数，r 的低 4 位与 low 一致，高 4 位与 hi 一致。那么我们如何求 r 的值呢？

是不是很容易想到

```c
    char hi = 1;
    char low = 1;
    int r = hi << 4 + low;
    printf("%d\n", r);
```

但是这种写法是错误的。因为加法的优先级高于移位操作。这就相当于`hi << 4 + low`结果是 32，而非 17。所以我们需要加上括号。

```c
#include <stdio.h>

main()
{
    char hi = 1;
    char low = 1;
    int r = hi << 4 + low;
    printf("%d\n", r);

    int r2 = (hi << 4) + low;
    printf("%d\n", r2);
}
```

最关键的两条优先级顺序我们需要记住：

- 任何一个逻辑运算符的优先级低于任何一个关系运算符
- 移位运算符的优先级比算数运算符要低，但是比关系运算符高。

另外注意：涉及到赋值运算符时，经常会引起优先级混淆。需要额外注意。