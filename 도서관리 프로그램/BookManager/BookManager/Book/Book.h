//
//  Book.h
//  BookManager
//
//  Created by 전성훈 on 2024/01/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

// MARK: nonatomic -> 동시 스레드 접근이 가능하다.
// atomic은 기본 값
// MARK: Strong -> 기본 값 (객체 참조)
@property (nonatomic, strong) NSString *name, *genre, *author;

// method
-(void)bookPrint;

@end

NS_ASSUME_NONNULL_END
