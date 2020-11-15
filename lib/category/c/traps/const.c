#include <stdio.h>

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