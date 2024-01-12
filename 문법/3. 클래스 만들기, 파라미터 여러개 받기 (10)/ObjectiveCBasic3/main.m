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
        
        [hello setWheels:4 Seats:2];

        NSLog(@"wheels : %i, seats: %i", hello.wheels, hello.seats);
    }
    return 0;
}
