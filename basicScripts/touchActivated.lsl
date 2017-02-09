default {
    state_entry() {
        llSay(0, "Touch Me");
    }
    touch_start(integer touched) {
        llSay(0, "I have been touched");
    }
}
