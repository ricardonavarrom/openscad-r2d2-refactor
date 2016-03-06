include <constants.scad>

module secondaryCameraBody() {
    radius = 1.8;
    scalation = [SCALATION_NEUTRAL_ELEMENT, SCALATION_NEUTRAL_ELEMENT, 0.8];
    
    scale(scalation) 
        sphere(radius);
}

module secondaryCameraLens() {
    height = 1;
    radius = 0.8;
    translation = [-1, TRANSLATION_NEUTRAL_ELEMENT, TRANSLATION_NEUTRAL_ELEMENT];
    rotation = [ROTATION_NEUTRAL_ELEMENT, changeSign(QUARTER_ROTATION), ROTATION_NEUTRAL_ELEMENT];
    
    translate(translation) 
        rotate(rotation) 
            cylinder(height, radius, radius);
}

module secondaryCamera() {
    translation = [-6, -5, 43];
    rotation = [ROTATION_NEUTRAL_ELEMENT, 20, 25];
    
    translate(translation)
        rotate(rotation) 
            union() {
                secondaryCameraBody();
                secondaryCameraLens();
            }
}
