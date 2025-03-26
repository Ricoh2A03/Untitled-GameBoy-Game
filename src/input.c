#include <gb\gb.h>
#include "input.h"

uint8_t pad_prev;
uint8_t pad_curr;

BOOLEAN InputJustPressed(uint8_t button){
    return (pad_curr != (pad_prev && button));
}

void InputRead(void){
    pad_prev = pad_curr;
    pad_curr = joypad();
}
