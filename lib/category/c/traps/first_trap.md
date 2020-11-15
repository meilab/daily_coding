C 语言编程是一项技艺，一个聪明的程序员很快就能学会 C 语言中基础的知识。但是要体会出 C 语言的细微之处，成为专家，则需要很长的时间，编写很多的程序。

相信很多编程新手都曾经犯过这个错误

```C
if( i = 3)
```

其实应该是

```c
if( i == 3 )
```

所以 C 语言的高手们一般会在比较语句中把常量写在前面，如果不小心写成了赋值=，编译器就会报错

```c
if( 3 == i )
```

十一期间我就不更新了，休假结束之后我会和大家分享一些 C 语言的思想，习惯用法和技巧，针对的是已经了解了 C 基础知识的朋友。后续我也会和大家分享一些 Flutter 和 React 的相关知识