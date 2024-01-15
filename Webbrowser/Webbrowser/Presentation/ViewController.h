//
//  ViewController.h
//  Webbrowser
//
//  Created by 전성훈 on 2024/01/15.
//

#import <UIKit/UIKit.h>

#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, WKNavigationDelegate> {
    NSArray *segmentControlItems;
    NSURL *currentURL;
}

@property (nonatomic, strong) UISegmentedControl *favoritesSegmentedcontrol;
@property (nonatomic, strong) UITextField *addressField;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIToolbar *webToolBar;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end
