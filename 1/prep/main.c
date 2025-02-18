#include <stdint.h>
#include <stdio.h>

void first(char* str);
void second(uint64_t arr[]);
void third(uint64_t arr[], uint32_t* a, uint32_t* b);
void fourth(uint64_t int_in, char* str_out);

int main() {
    // 1
    char str[] = "Ahoj.";
    first(str);
    printf("1: %s\n", str);

    // 2
    uint64_t arr[] = {33, 44, 55, 0x66554433221100};
    second(arr);
    printf("2:");
    for (uint8_t i = 0; i < 4; i++)
        printf(" %llu", arr[i]);
    puts("");

    // 3
    uint32_t a;
    uint32_t b;
    third(arr, &a, &b);
    printf("3: a: %u\n   b: %u\n", a, b);

    // 4
    uint64_t passwd_in = 0x70617373776f7264;
    char passwd_out[8];
    fourth(passwd_in, passwd_out);
    printf("4: %s\n", passwd_out);
}
