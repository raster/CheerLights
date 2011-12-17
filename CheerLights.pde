/*
 * CheerLights.pde 
 *
 */
 
#include "HughesyShiftBrite.h"

HughesyShiftBrite sb;

void setup() {
  sb = HughesyShiftBrite(10,11,12,13);
  sb.sendColour(0,0,0);
  Serial.begin(9600);
}


void loop() {

  int input = Serial.read();
  
  switch (input) {
  case 48:
    sb.sendColour(1000,0,0); // red 0
    break;
  case 49:
    sb.sendColour(0,1000,0); // green 1
    break;
  case 50:
    sb.sendColour(0,0,1000); // blue 2
    break;
  case 51:
    sb.sendColour(0,1000,700); // cyan 3
    break;
  case 52:
    sb.sendColour(900,900,900); // white 4
    break;
  case 53:
    sb.sendColour(900,600,700); // warmwhite 5
    break;
  case 54:
    sb.sendColour(300,200,1000); // purple 6
    break;
  case 55:
    sb.sendColour(700,0,1000); // magenta 7
    break;
  case 56:
    sb.sendColour(900,1000,0); // yellow 8
    break;
  case 57:
    sb.sendColour(1000,500,0); // orange 9
    break;
  }

}

