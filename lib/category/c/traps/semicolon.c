#include <stdio.h>

int max(int a, int b)
{
    int ret = a;
    if (a < b);
      ret = b;
    return ret;
}

main()
{
    int ret = max(30, 20);
    printf("%d", ret);
}
