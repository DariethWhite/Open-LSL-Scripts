//Basic counter based off touch.  The variant only uses one line to increment
//and says.  Only tested on tag.

integer counter;

default {
    state_entry() {
        counter = 0;
    }
    touch_start)() {
        llSays("I have been touched " + ++counter + " times.");
    }
}
