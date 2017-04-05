//This script will generate a list of objects contained within.  On clicking
//it will present the user with a menu of things to rez.  Again a script in the
//rezzed item will be need to auto derez the item.
//Object names have to be under 24 characters
//Menu Logic currently fails.  Will fix.

list itemList;
integer numberObjects;
integer channel; //Random channel assigned during state_entry
integer listener;

GenerateList() {
    if(llGetInventoryNumber(INVENTORY_OBJECT) > 0) {
        numberObjects = llGetInventoryNumber(INVENTORY_OBJECT);
        integer i;
        itemList = [];
        for(i=0; i<numberObjects; i++) {
            itemList += llGetInventoryName(INVENTORY_OBJECT, i);
        }
        llSetText("Click me to rez", <1,1,1>,1);
    }
    else {
        itemList = [];
        numberObjects = 0;
        llSetText("Nothing to rez", <1,0,0>, 1);
    }
}

GenerateMenu(integer page, key id) {
    //No handling for going passed the end of the list.
    list buttons = [];
    page--;
    if(numberObjects > 0) {
        integer start;
        integer end;
        start = (page * 9);
        end = (page-1 * 9);
        buttons = ["Page " + (string)(page-1),"Cancel","Page " + (string)(page+1)];
        buttons += llList2List(itemList,start,end);
        llDialog(id, "Pick an item to rez", buttons, channel);
        if(!listener) {
            listener = llListen(channel, "", NULL_KEY, "");
        }
        llSetTimerEvent(30);
    }
    else {
        llSay(0, "I have nothing to rez");
    }
}

default {
    state_entry() {
        channel = (integer)(llFrand(50000)* -1);
        GenerateList();
    }
    touch_start(integer touched) {
        GenerateMenu(1, llDetectedKey(0));
    }
    changed(integer change) { //watch for inventory changes and update list.
        if(change & CHANGED_INVENTORY) {
            GenerateList();
        }
    }
    listen(integer channel, string name, key id, string message) {
        if(llSubStringIndex(message, "Page") > -1) {
            GenerateMenu((integer)llGetSubString(message, 6, 6), id);
        }
        else {
            llRezObject(message, <0,0,1>, ZERO_VECTOR, ZERO_ROTATION, 1);
        }
    }
    timer() {
        llListenRemove(listener);
        listener = 0;
    }
}
