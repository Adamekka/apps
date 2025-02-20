V dvouprvkovém poli typu char spojte prvky 0 a 1 do proměnné typu short. Výslednou hodnotu převeďte do výstupní proměnné typu int a doplňte zleva 0.

```c
char g_char2[ 2 ] = { 0xCA, 0xFE };
short g_short_merged;
int g_extended;
...
...
merge_and_extend();
printf( "Variables g_short_merged=%d, g_extended=%#010x\n", g_short_merged, g_extended );
```

Proveďte rozložení proměnné typu int do pole typu charu. Výsledné pole dle potřeby upravte a vypište.

```c
int enc_string = 0x53415050;
decode();
printf( "String = %s\n", g_decoded);
```
