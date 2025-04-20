#include <stdio.h>
#include <stdint.h>
#include "./common.h"

// Representation: <angle_deg> * 2^16 / 180
uint16_t atantable[NUMBER_OF_ITERATIONS] = {  
    0x4000,   //atan(2^0) = 45 degrees
    0x25C8,   //atan(2^-1) = 26.5651
    0x13F6,   //atan(2^-2) = 14.0362
    0x0A22,   //7.12502
    0x0516,   //3.57633
    0x028B,   //1.78981
    0x0145,   //0.895174
    0x00A2,   //0.447614
    0x0051,   //0.223808
    0x0029,   //0.111904
    0x0014,   //0.05595
    0x000A,   //0.0279765
    0x0005,   //0.0139882
    0x0003,   //0.0069941
    0x0002,   //0.0035013
    0x0001    //0.0017485
};

void low_level_simulation(uint16_t* theta, uint16_t* sin, uint16_t* cos, uint16_t* phi){
    uint16_t cos_next;
    int i;
    
    // Edge cases
    if(*theta == 0x4000) {
        *sin = 0x5A82; 
        *cos = 0x5A82;
        *phi = 0x4000;
    } else if(*theta == 0){
        *sin = 0; 
        *cos = 0x8000;
        *phi = 0;
    }

    for(i = 0; i < NUMBER_OF_ITERATIONS; i++){
        // Standard cases
        if(*phi < *theta){
            cos_next = *cos - (*sin >> i);
            *sin += (*cos >> i); 
            *cos = cos_next;
            *phi += atantable[i];
        } else if (*phi > *theta){
            cos_next = *cos + (*sin >> i);
            *sin -= (*cos >> i); 
            *cos = cos_next;
            *phi -= atantable[i];
        }
    }
}