//'Advanced' Touch to trigger sound.  Picks the first sound in the
//prims inventory
//some error checking exists.
//Script requires a reset after fixing errors.

string error;
string sound;

default {
    state_entry() {
        error = "";
        if(llGetInventoryNumber(INVENTORY_SOUND) == 1) { 
            sound = llGetInventoryName(INVETORY_SOUND, 0);
        }
        else { 
            integer count = llGetInventoryNumber(INVENTORY_SOUND);
            if(count > 1) {
                error = "To many sounds";
                llSay(0, "Only works with one sound. Currently has " + 
                    (string)count);
            }
            else {
                error = "No sounds";
                llSay(0, "No Sounds loaded."); 
            }
        }
    }
    touch_start(integer touched) {
        if(!error) {
            llPlaySound(sound, 1);
        }
        else { 
            llSay(0, error);
        }
    }
}
