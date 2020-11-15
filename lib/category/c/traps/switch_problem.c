#include <stdio.h>

main()
{
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

    int p = 4;
    int apple = sizeof(int) * p;
    printf("%d", apple);
}