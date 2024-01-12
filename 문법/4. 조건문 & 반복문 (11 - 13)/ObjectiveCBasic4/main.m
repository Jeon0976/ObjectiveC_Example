//
//  main.m
//  ObjectiveCBasic4
//
//  Created by 전성훈 on 2024/01/11.
//

#import <Foundation/Foundation.h>
#import "Vehicle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Vehicle *hello = [[Vehicle alloc] init];
        
        [hello setWheels:5 Seats:2];
        
        if (hello.wheels == 4) {
            NSLog(@"wheels : 4 ");
        } else {
            NSLog(@"NO");
        }
        
        switch (hello.seats) {
            case 4:
                NSLog(@"seats : 4 ");
                break;
            case 3:
                NSLog(@"seats : 3 ");
                break;
            case 2:
                NSLog(@"seats : 2 ");
                break;
            default:
                NSLog(@"No");
                break;
        }
        
        for (int i=0; i<hello.wheels; i++) {
            NSLog(@"wheels : %i", i);
        }

        NSLog(@"wheels : %i, seats: %i", hello.wheels, hello.seats);
    }
    return 0;
}
