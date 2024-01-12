//
//  main.m
//  5. NSString, NSMutableString
//
//  Created by 전성훈 on 2024/01/11.
//

// https://developer.apple.com/documentation/foundation/nsstring?language=objc

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // MARK: NSString 초기화 방법
        
        // new를 안쓰고 alloc init을 사용하는 이유가
        // 공식문서를 확인해보면 initWith~  (convenience init)
//        NSString *str = [[NSString alloc] init];
//        str = @"안녕 NSString";
        
        // convenience method 때문에 new대신 alloc init을 사용하는 것
//        NSString *str = [[NSString alloc] initWithString: @"안녕 NSString"];
        
        // 위 처럼 하면 경고가 나는데 NSString은 워낙 많이 사용해서
        // 따로 동적할당 할 필요없이 그냥 해도 만들 수 있다.
        NSString *str = @"안녕 NSString";
        
        NSLog(@"%@", str);
        
        // MARK: NSString 클래스 메서드들
        // NSString은 immutable class이다 즉, 중간에 값을 수정할 수 없다.
        NSString *result;
        result = [str substringToIndex:4];
        
        NSString *result2;
        result2 = [str substringFromIndex:4];
        
        NSString *result3;
        result3 = [[str substringToIndex:5]substringFromIndex:3];
        
        NSString *result4;
        // location, length
        result4 = [str substringWithRange: NSMakeRange(3, 2)];
        
        // uppercast, lowercast...
        
        NSLog(@"%@", result);
        NSLog(@"%@", result2);
        NSLog(@"%@", result3);
        NSLog(@"%@", result4);
        
        
        // MARK: NSMutableString
        NSMutableString *mstr = [NSMutableString stringWithString: str];
        
        [mstr appendString:@" and NSMutableString"];
        [mstr insertString:@" HI We are" atIndex:2];
        [mstr deleteCharactersInRange: NSMakeRange(0, 3)];
        
        NSLog(@"%@", mstr);
    }
    
    return 0;
}
