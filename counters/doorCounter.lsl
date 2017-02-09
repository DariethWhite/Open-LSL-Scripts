//Basic collisionn based counter.  No memory of who its seen.

integer counter;

default {
    state_entry() {
        counter = 0;
    }
    collision_start(integer bump) {
        //You can also increment the counter outside the llSay();
        llSay(0, ++counter + " collisions have occured");
    }
}
