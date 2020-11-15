C 语言中的 const 容易引起混淆，const 在 C 语言中表征的并不是常量，而是只读。const 最有用之处是用来限定形参，这样该函数就不会修改实参指针所指向的数据，但是其他的函数却可以修改它。比如 C 语言标准库中的很多函数的形参就使用 const 限定了，这样就能保证函数内部不会修改参数的值。

```c
int strcmp ( const char * str1, const char * str2 );
```

const 加上指针之后，会略微增加理解难度。下面这段代码，limitp 是一个指向整型的指针，我们不能用 limitp 来修改整形的值，但是我们可以修改 limitp 的指向，也就是指针本身的值。

```c
main()
{
    const int limit = 10;
    const int *limitp = &limit;
    printf("limit = %d\n", *limitp);

    int i = 27;
    limitp = &i;
    printf("limit = %d\n", *limitp);

    // below code will lead to error
    // *limitp = 20;
    // printf("limit = %d\n", *limitp);
}
```

下面例子中，前两个表示指针指向的对象是只读的，第三个表示指针本身是只读的。第四个表示都只读

```c
const int * man;
int const * man;
int * const dog;

const int * const food;
int const * const food;
```
