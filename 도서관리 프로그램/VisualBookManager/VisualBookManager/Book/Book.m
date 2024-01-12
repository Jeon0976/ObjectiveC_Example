//
//  Book.m
//  BookManager
//
//  Created by 전성훈 on 2024/01/11.
//

#import "Book.h"

@implementation Book
// 안해도 괜찮은데 안하면 인텔리션 키가 동작을 안할수가 있음
@synthesize name, genre, author;

-(void)bookPrint{
    NSLog(@"Name: %@", name);
    NSLog(@"Genre: %@", genre);
    NSLog(@"Author: %@", author);
}

@end
