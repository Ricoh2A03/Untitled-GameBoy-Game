#ifndef GB_INPUTLIB_H
#define GB_INPUTLIB_H

#include <gb\gb.h>

/** Returns TRUE only if current input isn't equal
 *  to the button currently checked.
*/
BOOLEAN InputJustPressed(uint8_t button);

/** Reads current input state and sets previous
 *  state to last frame's input state.
*/
void InputRead(void);

#endif
