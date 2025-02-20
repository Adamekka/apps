#include <stdint.h>
#include <stdio.h>

// -- 1 --
char g_char2[2] = {0xCA, 0xFE};
int16_t g_short_merged;
int32_t g_extended;

void merge_and_extend();
// -------

// -- 2 --
int32_t enc_string = 0x53415050;
char g_decoded[4];

void decode();
// -------

int main() {
    // -- 1 --
    merge_and_extend();
    printf(
        "Variables g_short_merged=%d, g_extended=%#010x\n",
        g_short_merged,
        g_extended
    );
    // -------

    // -- 2 --
    decode();
    printf("String = %s\n", g_decoded);
    // -------
}
