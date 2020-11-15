#include <stdio.h>

main()
{
    printf("\n");
    printf('\n'); // segmentation fault
    printf("%d\n", "yes");
    printf("%d\n", 'yes');
    // printf('yes');
}