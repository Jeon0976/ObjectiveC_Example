//
//  Vehicle.h
//  ObjectiveCBasic3
//
//  Created by 전성훈 on 2024/01/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Vehicle : NSObject {
}

@property int wheels;
@property int seats;

// MARK: 파라미터 여러개 받기
-(void)setWheels:(int)w Seats:(int)s;

// 파라미터 여러개 받기 만드는 방법 예시 들
// 중점은 콜론이 기준이며, 띄어쓰기로 구분한다.
-(void)drawCircleX:(int)x Y:(int)y R:(int)r;
-(void)drawCircleXYR:(int)x :(int)y :(int)r;

-(void)print;

@end

NS_ASSUME_NONNULL_END
