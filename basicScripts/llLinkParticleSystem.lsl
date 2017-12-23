list params = [
PSYS_PART_FLAGS,        PSYS_PART_INTERP_SCALE_MASK | PSYS_PART_INTERP_COLOR_MASK | PSYS_PART_EMISSIVE_MASK , //Flags
PSYS_SRC_PATTERN,       PSYS_SRC_PATTERN_ANGLE_CONE, //Shape
PSYS_SRC_ANGLE_BEGIN,   0,
PSYS_SRC_ANGLE_END,     PI,
PSYS_PART_START_COLOR,  <255,0,0>
];

list targetPrims = [];
integer length =0;
integer on;

makeShower() {
    integer i;
    on = 1;
    for(i=0; i<=length; i++){
        llLinkParticleSystem(i,params);
    }
}
showerOff() {
    integer i;
    on = 0;
    for(i=0; i<=length; i++){
        llLinkParticleSystem(i,[]);
    }
}

findPrims (){ // scan prims.
    integer links = llGetNumberOfPrims();
    integer i;
    targetPrims = [];
    for(i=0; i<=links; i++) {
        string primDesc = llList2String(llGetLinkPrimitiveParams(i, [PRIM_DESC]),0);
        if(primDesc == "emitter") {
            targetPrims += [i];
        }
    }
    length = llGetListLength(targetPrims);
}
default
{
    state_entry()
    {
        llSay(0, "Script running");
        findPrims();
        showerOff();
    }
    touch_start(integer touched) {
        if(!on) {
            makeShower();
        }
        else {
            showerOff();
        }
    }
    changed(integer change) { //watch for new prims and rescan
        if(change & CHANGED_LINK) {
            findPrims();
        }
    }
}
