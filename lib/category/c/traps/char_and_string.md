在 C 语言中，单引号和双引号的含义是不同的。

用单引号引起的一个字符实际上代表一个整数，对于 ASCII 字符集而言，'a'对应于数字 97。

双引号引起的是字符串，代表的是一个指向数组的指针，该数组被双引号之间的字符以及一个额外的二进制值为零的'\0'初始化。比如说"a"就是一个 a 和一个'\0'

在有些情况下用错单引号和双引号之后，编译器并不会报错。运行时会产生意想不到的错误。比如说`printf("\n");`是换行，如果不小心打成了单引号，就会造成`segmentation fault`这个著名的难以 debug 的错误。

```c
    printf("\n");
    printf('\n'); // segmentation fault
```
