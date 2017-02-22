//Basic Touch to trigger sound.  Picks the first sound in the
//prims inventory
//No error checking exists.

string sound;

default {
    state_entry() {
        sound = llGetInventoryName(INVETORY_SOUND, 0);
    }
    touch_start(integer touched) {
        llPlaySound(sound, 1);
    }
}
