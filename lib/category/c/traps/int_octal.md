整形常量大家都很熟悉，这里给大家提醒一个容易疏忽的潜在风险。如果一个整型常量的第一个字符是数字 0，那么该常量将被视作八进制数字。所以 10 和 010 的含义是不一样的。举个例子。

有些情况下，我们会为了对齐的需要，无意中将十进制数写成了八进制数字。比如下面这样。

```c

#include <stdio.h>

struct
{
    int part_number;
    char *description;
} parttab[] = {
    046,
    "left-handed widget",
    047,
    "right-handed widget",
    125,
    "frammis",
};

main()
{
    printf("%d\n", parttab[0].part_number);
}
```
