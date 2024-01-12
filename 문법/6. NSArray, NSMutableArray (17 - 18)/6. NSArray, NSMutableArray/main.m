//
//  main.m
//  6. NSArray, NSMutableArray
//
//  Created by 전성훈 on 2024/01/11.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // MARK: NSArray
        // NSArray, NSMutableArray의 속도차이가 조금 크다.
        // Static Array를 만들거면 NSArray 사용
        NSArray *month = [[NSArray alloc]initWithObjects: @"1월", @"2월", @"3월", @"4월", @"5월", @"6월", @"7월", @"8월", @"9월", @"10월", @"11월", @"12월", nil];
//        
//        for (int i=0; i< [month count]; i++) {
//            NSLog(@"month: %@", [month objectAtIndex:i]);
//        }
        
        for (NSString *strTemp in month) {
            NSLog(@"month: %@", strTemp);
        }
        
        // MARK: NSMutableArray
        NSMutableArray *mMonth = [NSMutableArray arrayWithArray:month];
        
        [mMonth addObject: @"---End---"];
        [mMonth insertObject:@"---Start---" atIndex:0];
        
        for (NSString *strTemp in mMonth) {
            NSLog(@"month: %@", strTemp);
        }
    }
    return 0;
}
