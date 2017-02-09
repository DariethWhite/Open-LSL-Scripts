//Simple impact/bumb/collision activated scripts.  Any funcion can replace the
//llSay()  collision_end or collision could replace collision_start.  If you
//and will change the trigger points.  collision will do both on start and end.

blowup() {
    //Break all links.  This will generally cause things to fly apart.
    llBreakAllLinks();
}

default {
    state_entry() {
        //Entry point stuff goes here. Setting of values or obtaining variables.
    }
    collision_start(integer bump) {
        llSay(0, "ouch");
        //Below calls a custom function.
        //blowup();
    }
}
