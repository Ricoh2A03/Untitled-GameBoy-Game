#include <gb\gb.h>
#include <gb\hardware.h>
#include <stdint.h>

#include "input.h"

uint8_t framecount;

void main(void)
{

    DISPLAY_ON;
    SHOW_BKG;

    // Loop forever
    while(1) {
        // Game main loop processing goes here

        if (InputJustPressed(J_RIGHT)) {scroll_bkg(1, 0);}

        InputRead();

        vsync(); // Done processing, yield CPU and wait for start of next frame
        framecount = framecount + 1;
    }

}
