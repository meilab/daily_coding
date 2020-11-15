#include <stdio.h>

struct
{
    int part_number;
    char *description;
} parttab[] = {
    046,
    "left-handed widget",
    047,
    "right-handed widget",
    125,
    "frammis",
};

main()
{
    printf("%d\n", parttab[0].part_number);
}