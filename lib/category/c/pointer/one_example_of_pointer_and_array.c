#include <stdio.h>

printArray(char a[])
{
    printf("&a=%d, &(a[0])=%d, &(a[1])=%d\n", &a, &(a[0]), &(a[1]));
}

printPointer(char *p)
{
    printf("&p=%d, &(p[0])=%d, &(p[1])=%d, ++p=%d\n", &p, &(p[0]), &(p[1]), ++p);
}

char ga[10] = "hello";

main()
{
    printArray(ga);
    printPointer(ga);
    printf("&ga=%d, &(ga[0])=%d, &(ga[1])=%d\n", &ga, &(ga[0]), &(ga[1]));
}