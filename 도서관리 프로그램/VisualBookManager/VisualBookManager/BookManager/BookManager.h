//
//  BookManager.h
//  BookManager
//
//  Created by 전성훈 on 2024/01/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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
