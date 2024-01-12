//
//  main.m
//  ObjectiveCBasic2
//
//  Created by 전성훈 on 2024/01/11.
//

// MARK: getter, setter를 기존 basic처럼 만들면 노가다성 코드이기 때문에 줄일 필요가 있다. 활용되는 방법은 property를 활용한다.
#import <Foundation/Foundation.h>

@interface Vehicle : NSObject {
    // 내부 변수로 사용할 예정이라면 여기에만 설정함
    
    // property로 만들게 되면 이러한 것들도 생략 가능
//    int wheels;
//    int seats;
}

// getter setter를 자동으로 만들어 줌
// property로 만들게 되면 무조건 set 형식은 setWheels, get 형식은 wheels 처럼 만들어지게 된다.
@property int wheels;
@property int seats;

// MARK: property 사이에 옵션 설정 가능 -> getter, setter 설정 가능
//@property (getter = getWheels, setter = wheels:) int wheels;
 
// setter
//-(void)setWheels:(int)w;
//-(void)setSeats:(int)s;
-(void)print;

// getter
//-(int)wheels;
//-(int)seats;


@end

@implementation Vehicle

// 원래는 property를 설정하면 synthesize를 해줬어야 했다.
// 하지만 없으면 조금 불편함
// 지금은 생략 가능
@synthesize wheels;
@synthesize seats;


//-(void)setWheels:(int)w; {
//    wheels = w;
//}
//-(void)setSeats:(int)s; {
//    seats = s;
//}

//-(int)wheels {
//    return wheels;
//}
//-(int)seats {
//    return seats;
//}

-(void)print; {
    NSLog(@"wheels: %i, seats: %i", wheels, seats);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Vehicle *hello = [[Vehicle alloc] init];
        
        [hello setWheels:4];
        [hello setSeats:2];
        NSLog(@"wheels : %i, seats: %i", [hello wheels], [hello seats]);
        [hello print];

        // MARK: Dot Operator
        // 위 형식이 너무 불편해서 도트연산자를 도입해줬음
        // setter dot operator
        hello.wheels = 5;
        hello.seats = 3;
        
        // getter dot operator
        NSLog(@"wheels : %i, seats: %i", hello.wheels, hello.seats);
    }
    return 0;
}
