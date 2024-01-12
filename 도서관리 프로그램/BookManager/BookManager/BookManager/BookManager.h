//
//  BookManager.h
//  BookManager
//
//  Created by 전성훈 on 2024/01/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: 선언관련
// 선언부에서는 통상 import를 하지 않는다. 그렇다면 어떻게 다른 파일을 불러올수있을까?
// @class를 사용하면 가능하다
// 간단하게 설명하면 Book 클래스가 있으니깐 complie error가 발생하지 말라는 뜻으로 해석할 수 있으며, 좋은 기능은 4가지 정도 있다.
// 1. 컴파일이 빨리짐
// 2. Circular Dependency Error를 배제할 수 있다.
// a <- b <- c <- a (순한참조)
@class Book;

@interface BookManager : NSObject {
    NSMutableArray *bookList;
}

-(void) addBook:(Book *)bookObject;
-(NSString *) showAllBook;
-(NSUInteger) countBook;

-(Book *) findBook:(NSString *)name;
-(Book *) removeBook: (NSString *)name;

@end

NS_ASSUME_NONNULL_END
