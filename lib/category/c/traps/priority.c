#include <stdio.h>

main()
{
    char hi = 1;
    char low = 1;
    int r = hi << 4 + low;
    printf("%d\n", r);
    // printf('yes');

    int r2 = (hi << 4) + low;
    printf("%d\n", r2);
}