//
//  Vehicle.m
//  ObjectiveCBasic3
//
//  Created by 전성훈 on 2024/01/11.
//

#import "Vehicle.h"

@implementation Vehicle

@synthesize wheels;
@synthesize seats;

-(void)setWheels:(int)w Seats: (int)s{
    wheels = w;
    seats = s;
}

-(void)print; {
    NSLog(@"wheels: %i, seats: %i", wheels, seats);
}

@end
