//
//  BookManager.m
//  BookManager
//
//  Created by 전성훈 on 2024/01/12.
//

#import "BookManager.h"
#import "Book.h"

@implementation BookManager

- (instancetype)init {
    if (self = [super init]) {
        // Initialize self
        bookList = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void) addBook:(Book *)bookObject {
    [bookList addObject:bookObject];
}

-(NSString *) showAllBook {
    NSMutableString *strTemp = [[NSMutableString alloc]init];
    
    for (Book *bookTemp in bookList) {
        [strTemp appendString: @"Name : "];
        [strTemp appendString: bookTemp.name];
        [strTemp appendString: @"\n"];

        [strTemp appendString: @"Genre : "];
        [strTemp appendString: bookTemp.genre];
        [strTemp appendString: @"\n"];

        [strTemp appendString: @"Author : "];
        [strTemp appendString: bookTemp.author];
        [strTemp appendString: @"\n"];
        [strTemp appendString: @"-----------"];

        [strTemp appendString: @"\n"];

    }
    
    return strTemp;
}

-(NSUInteger) countBook {
    return [bookList count];
}

-(Book *) findBook:(NSString *)name {
    Book *bookTemp = [[Book alloc]init];
    
    for (Book *temp in bookList) {
        if ([temp.name isEqualToString:name]) {
            bookTemp = temp;
            return bookTemp;
        }
    }
    
    return nil;
}

-(Book *) removeBook:(NSString *)name {
    Book *bookTemp = [[Book alloc]init];
    
    for (Book *temp in bookList) {
        if ([temp.name isEqualToString:name]) {
            [bookList removeObject: temp];
            bookTemp = temp;
            return bookTemp;
        }
    }
    
    return nil;
}

@end
