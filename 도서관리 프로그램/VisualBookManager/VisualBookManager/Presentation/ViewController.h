//
//  ViewController.h
//  VisualBookManager
//
//  Created by 전성훈 on 2024/01/12.
//

#import <UIKit/UIKit.h>

@class BookManager;
@interface ViewController : UIViewController <UITextFieldDelegate> {
    BookManager *myBook;
}

@property (nonatomic, strong) IBOutlet UITextView *resultTextView;
@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *genreTextField;
@property (nonatomic, strong) IBOutlet UITextField *authorTextField;
@property (nonatomic, strong) IBOutlet UILabel *countLabel;

-(IBAction)showAllBookAction:(id)sender;
-(IBAction)addBookAction:(id)sender;
-(IBAction)findBookAction:(id)sender;
-(IBAction)removeBookAction:(id)sender;

-(void)updateBookCount;

@end

