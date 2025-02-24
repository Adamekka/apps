#include <stdint.h>
#include <stdio.h>

#define INT_ARRAY_LEN 15

const int32_t g_int_array[INT_ARRAY_LEN]
    = {-3, -8, 80, 2710, 32, 439, 9099, 10, 77, -273, 2, 22222, 0, -23, 23};
const uint32_t g_int_array_len = INT_ARRAY_LEN;

int32_t g_int_outup = 0;

int32_t g_neg_val_array[INT_ARRAY_LEN] = {0};

char g_char_array[32] = "testovaci pole pro cv2";
uint32_t g_vowel_count;

void first();
void second();
void third();
void fourth();

int main() {
    first();
    printf("First: %d\n", g_int_outup);

    second();
    printf("Second:");
    for (size_t i = 0; i < INT_ARRAY_LEN; i++)
        printf(" %d", g_neg_val_array[i]);
    puts("");

    third();
    printf("Third: %u\n", g_vowel_count);

    fourth();
    printf("Fourth: %s\n", g_char_array);
}
