/* This is just a basic script since I dont use an LSL editor.
 * It can be used as a starting point.  And also demostrates
 * my prefered script layout.
*/

// Static/initial Params here

// Function Definitions.

basicFunctionDefiniton(type parameter[...]) {
  // This type has no return and should work on all grid.
  // Function stuff goes here.
}

type functionWithReturn(type paramenter[...]) {
  /* This function type is not actually supported, however it
   * does work on TAG, and other Opensim 0.9.  Has not been
   * tested with Second Life(TM) or InWorldz(TM).
  */ Use at your own risk.
  // Function stuff goes here.
}

doNothing() { //Placeholder function
  llOwnerSay("A call to doNothing exists");
}

//Default state.  Addtional states folow the same format.

default {
  state_entry() {
    doNothing();
    //Script startup stuff
  }
  on_rez(integer start) {
    doNothing();
    //On rez event
  }
}
