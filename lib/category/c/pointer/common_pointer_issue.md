C 语言提供了一些标准库函数，我们可以操作字符串，比如 strcpy，strcat。假如说我们有两个字符串 s 和 t，我们想把它们连接成一个字符串 r。下面的方法一目了然。定义一个字符串指针，然后拷贝过去。但是这是错的。因为我们并没有给 r 指向的地址分配内存空间容纳字符串。

```c
char * r;
// char r[100]
char * s = "hello ";
char * t = "world";
strcpy(r, s);
strcat(r, t);
```

使用 char r[100]的方式是 OK 的

```c
    char r[100];
    strcpy(r, s);
    strcat(r, t);
    printf("%s", r);
```

但是如果我们的字符串很长，超过 100 了，还是会有问题。所以我们就需要使用 malloc 来分配内存。

```c
    char *r;
    int len = strlen(s) + strlen(t);
    r = (char *)malloc(len);
    strcpy(r, s);
    strcat(r, t);
    printf("%s", r);
```

但是这么做还是有问题的。因为

- 分配内存可能会失败
- 分配的内存使用之后，要及时释放，切记。切记。
- 最重要的一点，分配的内存不够大。大家回想一下，字符串是需要以空字符作为结束标志。所以我们需要多分配一个字符的空间。
  正确的程序如下：

```c
    char *r;
    int len = strlen(s) + strlen(t) + 1;
    r = (char *)malloc(len);
    if (!r)
    {
        printf("Wrong");
    }
    strcpy(r, s);
    strcat(r, t);
    printf("%s", r);
    free(r);
```
