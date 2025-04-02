#include <gb\gb.h>
#include <gb\hardware.h>
#include <stdint.h>

#include "input.h"

#include "test_tiles.h"

uint8_t framecount;

void main(void)
{

    set_bkg_data(0, test_tile_count, test_tiles);

    DISPLAY_ON;
    SHOW_BKG;

    // Loop forever
    while(1) {
        // Game main loop processing goes here

        

        vsync(); // Done processing, yield CPU and wait for start of next frame
        
        InputRead();
        framecount = framecount + 1;
    
    }

}
