include <body.scad>
include <principal-camera.scad>
include <secondary-camera.scad>
include <extremities.scad>

module r2d2() {
    body();
    principalCamera();
    secondaryCamera();
    frontLeg();
    rightLeg();
    leftLeg();
}

r2d2();