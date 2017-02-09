//Basic counter based off touch.

integer counter;

default {
    state_entry() {
        counter = 0;
    }
    touch_start() {
        counter++;
        llSay(0, "I have been touched " + counter + " times.");
    }
}
