//
//  ViewController.m
//  VisualBookManager
//
//  Created by 전성훈 on 2024/01/12.
//

#import "ViewController.h"
#import "Book.h"
#import "BookManager.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize resultTextView;
@synthesize nameTextField, genreTextField, authorTextField;
@synthesize countLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    myBook = [[BookManager alloc]init];
    
    [myBook addBook:book1];
    [myBook addBook:book2];
    [myBook addBook:book3];
    
    resultTextView.editable = false;
    
    [self updateBookCount];
}

-(void)updateBookCount {
    NSMutableString *bookCountText = [[NSMutableString alloc]init];
    
    [bookCountText appendString: @"도서 개수: "];
    [bookCountText appendString:[NSString stringWithFormat:@"%li", [myBook countBook]]];
    
    countLabel.text = bookCountText;
}

-(IBAction)showAllBookAction:(id)sender {
    // 둘 다 가능
//    resultTextView.text = [myBook showAllBook];
    [resultTextView setText: [myBook showAllBook]];
}

-(IBAction)addBookAction:(id)sender {
    if ([myBook findBook:nameTextField.text]) {
        resultTextView.text = @"중복 등록입니다.";
    } else {
        Book *bookTemp = [[Book alloc]init];
        bookTemp.name = nameTextField.text;
        bookTemp.genre = genreTextField.text;
        bookTemp.author = authorTextField.text;
        
        [myBook addBook:bookTemp];
        resultTextView.text = @"책이 추가되었습니다.";
        
        [self updateBookCount];
    }
}

-(IBAction)findBookAction:(id)sender {
    Book * bookTemp = [myBook findBook:nameTextField.text];
    if (bookTemp) {
        NSMutableString *strString = [[NSMutableString alloc]init];
        
        [strString appendString: @"Name : "];
        [strString appendString: bookTemp.name];
        [strString appendString: @"\n"];

        [strString appendString: @"Genre : "];
        [strString appendString: bookTemp.genre];
        [strString appendString: @"\n"];

        [strString appendString: @"Author : "];
        [strString appendString: bookTemp.author];
        [strString appendString: @"\n"];
        [strString appendString: @"-----------"];
        
        resultTextView.text = strString;
    } else {
        resultTextView.text = @"검색된 책이 없습니다.";
    }
}

-(IBAction)removeBookAction:(id)sender {
    Book *bookTemp = [myBook removeBook:nameTextField.text];
    
    if (bookTemp) {
        NSMutableString *strString = [[NSMutableString alloc]init];
        [strString appendString: @"해당 책이 제거되었습니다.\n"];

        [strString appendString: @"-----------\n"];

        [strString appendString: @"Name : "];
        [strString appendString: bookTemp.name];
        [strString appendString: @"\n"];

        [strString appendString: @"Genre : "];
        [strString appendString: bookTemp.genre];
        [strString appendString: @"\n"];

        [strString appendString: @"Author : "];
        [strString appendString: bookTemp.author];
        [strString appendString: @"\n"];
        [strString appendString: @"-----------"];
        
        
        resultTextView.text = strString;
        
        [self updateBookCount];
    } else {
        resultTextView.text = @"제거할 책이 존재하지 않습니다.";
    }
}

@end
