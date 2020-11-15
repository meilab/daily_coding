大家知道这个代码的输出打印是什么吗？

```c
    switch (2)
    {
    case 1:
        printf("case 1 \n");
    case 2:
        printf("case 2 \n");
    case 3:
        printf("case 3 \n");
    case 4:
        printf("case 4 \n");
    default:
        printf("default \n");
    }
}
```

switch 语句最大的缺点是它不会在每个 case 标签后面的语句执行后自动终止，它会依次执行后面所有的 case 语句，除非遇到 break；这就导致我们需要在每个分支后面都加上 break，对开发者非常的不友好。当我们不小心遗漏 break 之后，就会造成一些难以理解的行为，需要额外注意。
