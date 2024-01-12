//
//  main.m
//  7. NSDictionary, NSMutableDictionary
//
//  Created by 전성훈 on 2024/01/11.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // MARK: NSDictionary
        NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"전성훈", @"이름", @30, @"나이", nil];
        
        NSLog(@"name : %@", [dic objectForKey: @"이름"]);
        NSLog(@"age : %@", [dic objectForKey: @"나이"]);

        
        // MARK: NSMutableDictionary
        NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary: dic];
        
        [mdic setObject:@"한국" forKey: @"국가"];
        
        NSLog(@"name : %@", [mdic objectForKey: @"이름"]);
        NSLog(@"age : %@", [mdic objectForKey: @"나이"]);
        NSLog(@"name : %@", [mdic objectForKey: @"국가"]);
    }
    return 0;
}
