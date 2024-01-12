//
//  main.m
//  BookManager
//
//  Created by 전성훈 on 2024/01/11.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "BookManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Book class
        Book *book1 = [[Book alloc]init];
        book1.name = @"햄릿";
        book1.genre = @"소설";
        book1.author = @"셰익스피어";
                
        Book *book2 = [[Book alloc]init];
        book2.name = @"노인과 바다";
        book2.genre = @"소설";
        book2.author = @"헤밍웨이";
                
        Book *book3 = [[Book alloc]init];
        book3.name = @"죄와 벌";
        book3.genre = @"소설";
        book3.author = @"톨스토이";
        
        // Book Manager class
        BookManager *myBook = [[BookManager alloc]init];
        
        [myBook addBook:book1];
        [myBook addBook:book2];
        [myBook addBook:book3];

        NSString *result = [[NSString alloc]init];
        
        result = [myBook showAllBook];
        
        NSLog(@"%@", result);
        NSLog(@"count: %li", [myBook countBook]);
        
        
        Book *bookResult = [[Book alloc]init];
        bookResult = [myBook findBook:@"죄와 벌"];
    
        if (bookResult != nil) {
            [bookResult bookPrint];
        } else {
            NSLog(@"찾으시는 책이 없습니다.");
        }
        
        Book *removeResult = [[Book alloc]init];
        removeResult = [myBook removeBook:@"노인과 바다"];
        
        if (removeResult != nil) {
            [removeResult bookPrint];
        } else {
            NSLog(@"찾으시는 책이 없습니다.");
        }
        
        NSLog(@"after remove count: %li", [myBook countBook]);
        NSLog(@"%@", [myBook showAllBook]);
    }
    return 0;
}
