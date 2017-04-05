// This script can only rez the named object.
// If the item does not have  script to derez it, it will remain in world.
string ItemName = "";//name goes here

default {
    state_entry() {
        llSetText("Click to rez", <255,255,255>, 1);
    }
    touch_start(integer touched) {
        llRezObject(ItemName, <0,0,1>, <0,0,0>, <0,0,0,0>, 1);
    }
}
