/*
 RGB LED Fading Code
 -------------------
 robotgrrl.com
 
 Based off of The Custom Geek's "Breathing" Sleep
 LED code:
 http://thecustomgeek.com/?p=37
 
 Fades some RGB LEDs and colour cycles them, like
 the cool "sleeping" LED effect!
 We just attach the LEDs to the Arduino's PWM out
 pins.
 If you need more LEDs, check out the TLC5940 from
 TI's free sample site. You can easily interface it
 with Arduino (there's a lib), and instead of
 fading from 0-255, it goes from 0-4096! And you can
 daisy chain them together for more fun!
 This code has the LEDs hardcoded for an example, but
 you will want to use an array if you use more LEDs.
 Posted this mainly for JMartinez9 in the AaE chat!
 
 */

// All of the pinouts of the LEDs
#define  LED3_RED       2
#define  LED3_GREEN     4
#define  LED3_BLUE      3

#define  LED2_RED       5
#define  LED2_GREEN     7
#define  LED2_BLUE      6

#define  LED1_RED       8
#define  LED1_GREEN     10
#define  LED1_BLUE      9

int i=0;
int j=0;

boolean fadingRainbow = true;

void setup() {
    
	init_leds();
    
    // We need to fade them in to look nice! :)
    for(i = 0 ; i <= 15; i+=1) {
        
        if(fadingRainbow) {
            
            analogWrite(LED1_RED, 255-i);
            analogWrite(LED2_RED, 255-i);
            analogWrite(LED3_RED, 255-i);
            
            analogWrite(LED1_GREEN, 255-i);
            analogWrite(LED2_GREEN, 255-i);
            analogWrite(LED3_GREEN, 255-i);
            
            analogWrite(LED1_BLUE, 255-i);
            analogWrite(LED2_BLUE, 255-i);
            analogWrite(LED3_BLUE, 255-i);
            
        } else {
            
            analogWrite(LED1_RED, 255-i);
            analogWrite(LED1_GREEN, 255-i);
            analogWrite(LED1_BLUE, 255-i);
            
            analogWrite(LED2_RED, 255-i);
            analogWrite(LED2_GREEN, 255-i);
            analogWrite(LED2_BLUE, 255-i);
            
            analogWrite(LED3_RED, 255-i);
            analogWrite(LED3_GREEN, 255-i);
            analogWrite(LED3_BLUE, 255-i);
            
        }
        
        delay(5);
    }
    
}

void loop() {

    // Main loop for the fading. All the LEDs start
    // off at dim (15), and end at dim... they never
    // go completely off since it is easier to make
    // the colours fade in and out
    // You can probably adjust the i+=1 for a faster 
    // fading rate
    for(i=15; i<=255; i+=1) { 
        
        // For fading the rainbow, it cycles from 
        // red to blue then to white and repeat
        if(fadingRainbow) {
            
            // Red: 0,1,5,6
            if(j == 0 || j == 1 || j == 5 || j == 6) {
                analogWrite(LED1_RED, 255-i);
                analogWrite(LED2_RED, 255-i);
                analogWrite(LED3_RED, 255-i);
            } else {
                analogWrite(LED1_RED, 255-15);
                analogWrite(LED2_RED, 255-15);
                analogWrite(LED3_RED, 255-15);
            }
            
            // Green: 1,2,3,6
            if(j == 1 || j == 2 || j == 3 || j == 6) {
                analogWrite(LED1_GREEN, 255-i);
                analogWrite(LED2_GREEN, 255-i);
                analogWrite(LED3_GREEN, 255-i);
            } else {
                analogWrite(LED1_GREEN, 255-15);
                analogWrite(LED2_GREEN, 255-15);
                analogWrite(LED3_GREEN, 255-15);
            }
            
            // Blue: 3,4,5,6
            if(j == 3 || j == 4 || j == 5 || j == 6) {
                analogWrite(LED1_BLUE, 255-i);
                analogWrite(LED2_BLUE, 255-i);
                analogWrite(LED3_BLUE, 255-i);
            } else {
                analogWrite(LED1_BLUE, 255-15);
                analogWrite(LED2_BLUE, 255-15);
                analogWrite(LED3_BLUE, 255-15);
            }
            
        // Or you can just do classic white
        } else {
            
            analogWrite(LED1_RED, 255-i);
            analogWrite(LED1_GREEN, 255-i);
            analogWrite(LED1_BLUE, 255-i);
            
            analogWrite(LED2_RED, 255-i);
            analogWrite(LED2_GREEN, 255-i);
            analogWrite(LED2_BLUE, 255-i);
            
            analogWrite(LED3_RED, 255-i);
            analogWrite(LED3_GREEN, 255-i);
            analogWrite(LED3_BLUE, 255-i);
            
        }
        
        // Here's the hardcoded part that does the
        // specific delays for the specific times
        if (i > 150) {
            delay(4);
        }
        if ((i > 125) && (i < 151)) {
            delay(5);
        }
        if (( i > 100) && (i < 126)) {
            delay(7);
        }
        if (( i > 75) && (i < 101)) {
            delay(10);
        }
        if (( i > 50) && (i < 76)) {
            delay(14);
        }
        if (( i > 25) && (i < 51)) {
            delay(18);
        }
        if (( i > 1) && (i < 26)) {
            delay(19);
        }
    }
    
    for(i = 255; i >=15; i-=1)
    {
        
        if(fadingRainbow) {
            
            // Red: 0,1,5,6
            if(j == 0 || j == 1 || j == 5 || j == 6) {
                analogWrite(LED1_RED, 255-i);
                analogWrite(LED2_RED, 255-i);
                analogWrite(LED3_RED, 255-i);
            } else {
                analogWrite(LED1_RED, 255-15);
                analogWrite(LED2_RED, 255-15);
                analogWrite(LED3_RED, 255-15);
            }
            
            // Green: 1,2,3,6
            if(j == 1 || j == 2 || j == 3 || j == 6) {
                analogWrite(LED1_GREEN, 255-i);
                analogWrite(LED2_GREEN, 255-i);
                analogWrite(LED3_GREEN, 255-i);
            } else {
                analogWrite(LED1_GREEN, 255-15);
                analogWrite(LED2_GREEN, 255-15);
                analogWrite(LED3_GREEN, 255-15);
            }
            
            // Blue: 3,4,5,6
            if(j == 3 || j == 4 || j == 5 || j == 6) {
                analogWrite(LED1_BLUE, 255-i);
                analogWrite(LED2_BLUE, 255-i);
                analogWrite(LED3_BLUE, 255-i);
            } else {
                analogWrite(LED1_BLUE, 255-15);
                analogWrite(LED2_BLUE, 255-15);
                analogWrite(LED3_BLUE, 255-15);
            }
            
        } else {
            
            analogWrite(LED1_RED, 255-i);
            analogWrite(LED1_GREEN, 255-i);
            analogWrite(LED1_BLUE, 255-i);
            
            analogWrite(LED2_RED, 255-i);
            analogWrite(LED2_GREEN, 255-i);
            analogWrite(LED2_BLUE, 255-i);
            
            analogWrite(LED3_RED, 255-i);
            analogWrite(LED3_GREEN, 255-i);
            analogWrite(LED3_BLUE, 255-i);
            
        }
        
        if (i > 150) {
            delay(4);
        }
        if ((i > 125) && (i < 151)) {
            delay(5);
        }
        if (( i > 100) && (i < 126)) {
            delay(7);
        }
        if (( i > 75) && (i < 101)) {
            delay(10);
        }
        if (( i > 50) && (i < 76)) {
            delay(14);
        }
        if (( i > 25) && (i < 51)) {
            delay(18);
        }
        if (( i > 1) && (i < 26)) {
            delay(19);
        }
    }
    
    j++;
    if(j == 7) j=0;
    
    delay(970);

    
}

// Here you will want to initialize all your LEDs
// it just removes some clutter from setup()
void init_leds() {
	digitalWrite(LED1_RED, 1);
	digitalWrite(LED1_GREEN, 1);
	digitalWrite(LED1_BLUE, 1);
    
	pinMode(LED1_RED, OUTPUT);
	pinMode(LED1_GREEN, OUTPUT);
	pinMode(LED1_BLUE, OUTPUT);
    
	digitalWrite(LED2_RED, 1);
	digitalWrite(LED2_GREEN, 1);
	digitalWrite(LED2_BLUE, 1);
    
	pinMode(LED2_RED, OUTPUT);
	pinMode(LED2_GREEN, OUTPUT);
	pinMode(LED2_BLUE, OUTPUT);
    
	digitalWrite(LED3_RED, 1);
	digitalWrite(LED3_GREEN, 1);
	digitalWrite(LED3_BLUE, 1);
    
	pinMode(LED3_RED, OUTPUT);
	pinMode(LED3_GREEN, OUTPUT);
	pinMode(LED3_BLUE, OUTPUT);
}

