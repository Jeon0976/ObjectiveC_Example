//
//  main.m
//  ObjectiveCBasic
//
//  Created by 전성훈 on 2024/01/11.
//

// MARK: 객체 정의 및 구현, 멤버 변수, 멤버 메소드 정의 및 구현, 객체 생성 및 메서드 호출

#import <Foundation/Foundation.h>

// {class (object), instance (object)} == object
// class -> 아래 있는 것 (member variable, member method)
// instance ->
// object
// 객체 선언
@interface Vehicle : NSObject {
    // member variable
    // member variable 영역에서는 초기화를 하면 안 된다.
    // 자동으로 0으로 초기화
    int wheels;
    int seats;
}
    
// member method
// method 정의 부분

// setter 정의
-(void)setWheels:(int)w;
-(void)setSeats:(int)s;
-(void)print;

// getter 정의
-(int)wheels;
-(int)seats;

@end

// 객체 구현
@implementation Vehicle

-(void)setWheels:(int)w; {
    wheels = w;
}
-(void)setSeats:(int)s; {
    seats = s;
}

-(int)wheels {
    return wheels;
}
-(int)seats {
    return seats;
}
-(void)print; {
    NSLog(@"wheels: %i, seats: %i", wheels, seats);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // int float double long... - primitive type
//        int wheels = 4;
//        int seats = 2;
        
        // 동적 할당
        // new라는 것을 사용해도 되지만 objective c에서는 관례적으로 new를 사용하지 않는다.
        // 메모리 동적할당과 초기화 하는 작업을 따로 실시
        // Objective C 는 메서드 체인이라는 것을 많이 사용한다.
//        Vehicle *hello = [Vehicle new]; // create instance object
        Vehicle *hello = [[Vehicle alloc] init];
        
        [hello setWheels:4];
        [hello setSeats:2];
        [hello print];
        
        NSLog(@"wheels : %i, seats: %i", [hello wheels], [hello seats]);

    }
    return 0;
}
