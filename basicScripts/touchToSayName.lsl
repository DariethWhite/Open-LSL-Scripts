/*  This is a simple touch based script that says the name of the toucher.
 *  llSay can be replaced with any other function even custom functions.
*/

default {
    state_entry() {
        llSay(0, "Touch Me");
    }
    touch_start(integer touched) {
        llSay(0, "I was touched by "  + llDetectedName(0));
        //llDetectedKey(0) would work to sayt he key.
    }
}
