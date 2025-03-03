#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define ARR_LEN 10

void uprav_pole(int32_t* arr, int32_t len);
int32_t hledej_max_msb(const int64_t* arr, int32_t len);
int32_t pocet_cislic(const char* str);
void nahrada_mezer(char* str, char c);

int main() {
    int32_t arr[ARR_LEN] = {1, 2, 3, 4, 5, -1, -2, -3, -4, -5};
    uprav_pole(arr, ARR_LEN);
    printf("uprav_pole:");
    for (size_t i = 0; i < ARR_LEN; i++)
        printf(" %d", arr[i]);
    puts("");

    const int64_t l_arr[ARR_LEN] = {
      0x1000000000000000,
      0x1200000000000000,
      0x1300000000000000,
      0x1400000000000000,
      0x1500000000000000,
      0x1600000000000000,
      0x1700000000000000,
      0x1800000000000000,
      0x1900000000000000,
      0x2000000000000000,
    };
    const int32_t hledej_max_msv_result = hledej_max_msb(l_arr, ARR_LEN);
    printf("hledej_max_msv: %d\n", hledej_max_msv_result);
    assert(hledej_max_msv_result == 9);

    const int32_t pocet_cislic_result = pocet_cislic("a1b2c3d4e5f6g7h8");
    printf("pocet_cislic: %d\n", pocet_cislic_result);
    assert(pocet_cislic_result == 8);

    char str[] = "a b c d";
    nahrada_mezer(str, ';');
    printf("nahrada_mezer: %s\n", str);
    assert(strcmp(str, "a;b;c;d") == 0);
}
