//
//  ViewController.m
//  Webbrowser
//
//  Created by 전성훈 on 2024/01/15.
//

#import "ViewController.h"

@interface ViewController ()

- (void)setupLayout;
- (void)setupAttribute;
- (void)setupWebViewURL;
- (void)setToolBarAttribute;

- (void)tappedFavoritesSegmentedControl:(UISegmentedControl *)sender;
- (void)goBack:(UIButton *)sender;
- (void)goForward:(UIButton *)sender;
- (void)refresh:(UIButton *)sender;
- (void)stopLoading:(UIButton *)sender;

@end

@implementation ViewController

- (instancetype)init {
    if (self = [super init]) {
        segmentControlItems = [[NSArray alloc]initWithObjects: @"facebook", @"naver", @"apple", @"google", nil];
    }
    return self;
}

@synthesize favoritesSegmentedcontrol, addressField, webView, webToolBar, activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLayout];
    [self setupAttribute];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing: YES];
}

- (void)setupLayout {
    self.favoritesSegmentedcontrol = [[UISegmentedControl alloc]initWithItems:segmentControlItems];
    self.addressField = [[UITextField alloc]init];
    self.webView = [[WKWebView alloc]init];
    self.webToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
        
    NSArray *views = [NSArray arrayWithObjects:
                      self.favoritesSegmentedcontrol,
                      self.addressField,
                      self.webView,
                      self.webToolBar,
                      self.activityIndicator,
                      nil
    ];
    
    for (UIView *view in views) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: view];
    }
    
    [self.view addConstraints: @[
        [self.favoritesSegmentedcontrol.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:16],
        [self.favoritesSegmentedcontrol.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0],
        [self.favoritesSegmentedcontrol.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
        
        [self.addressField.topAnchor constraintEqualToAnchor:self.favoritesSegmentedcontrol.bottomAnchor constant:0],
        [self.addressField.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.addressField.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.addressField.heightAnchor constraintEqualToConstant:30],
        
        [self.webView.topAnchor constraintEqualToAnchor: self.addressField.bottomAnchor constant:0],
        [self.webView.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant:0],
        [self.webView.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant:0],
        [self.webView.bottomAnchor constraintEqualToAnchor: self.webToolBar.topAnchor constant:0],
        
        [self.webToolBar.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:0],
        [self.webToolBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.webToolBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.webToolBar.heightAnchor constraintEqualToConstant:35],
        
        [self.activityIndicator.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:0],
        [self.activityIndicator.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:0]
    ]];
}

- (void)setupAttribute {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.favoritesSegmentedcontrol.selectedSegmentIndex = 1;
    [self.favoritesSegmentedcontrol addTarget:self action:@selector(tappedFavoritesSegmentedControl:) forControlEvents:UIControlEventValueChanged];

    self.addressField.delegate = self;
    self.webView.navigationDelegate = self;
    
    [self.addressField setClearButtonMode: UITextFieldViewModeWhileEditing];
    [self.addressField setKeyboardType: UIKeyboardTypeURL];
    [self.addressField setReturnKeyType: UIReturnKeyGo];
    [self.addressField.layer setBorderWidth: 0.5];
    self.addressField.textAlignment = NSTextAlignmentCenter;
    
    currentURL = [NSURL URLWithString:@"https://www.naver.com"];
    addressField.text = @"https://www.naver.com";
    
    [self.activityIndicator setHidden: YES];
    [self.activityIndicator startAnimating];
    [self.activityIndicator setColor: UIColor.blackColor];
    
    [self setupWebViewURL];
    [self setToolBarAttribute];
}

- (void)setupWebViewURL {
    // 네이버로 초기 홈페이지 설정
     NSURLRequest *request = [NSURLRequest requestWithURL:currentURL];
    
     [self.webView loadRequest: request];
}

- (void)setToolBarAttribute {
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"arrow.backward"] style:UIBarButtonItemStylePlain target:self.webView action:@selector(goBack)];
    UIBarButtonItem *forwardButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"arrow.forward"] style:UIBarButtonItemStylePlain target:self.webView action:@selector(goForward)];
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"arrow.clockwise"] style:UIBarButtonItemStylePlain target:self.webView action:@selector(reload)];
    UIBarButtonItem *stopButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"xmark"] style:UIBarButtonItemStylePlain target:self.webView action:@selector(stopLoading)];
    
    // 공백 아이템 생성
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    NSArray *toolbarItems = @[
        backButton,
        flexibleSpace,
        forwardButton,
        flexibleSpace,
        stopButton,
        flexibleSpace,
        refreshButton
    ];

    self.webToolBar.items = toolbarItems;
}

-(void)tappedFavoritesSegmentedControl:(UISegmentedControl *)sender {
    NSString *bookmarkURL = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
    
    addressField.text = bookmarkURL;
    
    NSString *urlString = [[NSString alloc]initWithFormat:@"https://www.%@.com", bookmarkURL];
    
    currentURL = [NSURL URLWithString: urlString];
    [self setupWebViewURL];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // MARK: HTTP/ HTTPS 존재 유무 확인 코드
    NSMutableString *urlString = [[NSMutableString alloc]initWithString:textField.text];
    
    // "https://" 접두사가 없는 경우 추가
     if (![urlString hasPrefix:@"https://www."] && ![urlString hasPrefix:@"https://m."] && ![urlString hasPrefix:@"https://"]) {
         [urlString insertString:@"https://" atIndex:0];
     }

     // "www." 또는 "m." 접두사가 없는 경우 추가
     if (![urlString containsString:@"www."] && ![urlString containsString:@"m."]) {
         NSRange httpsRange = [urlString rangeOfString:@"https://"];
         [urlString insertString:@"www." atIndex:NSMaxRange(httpsRange)];
     }

     // ".com" 접미사가 없는 경우 추가
     if (![urlString hasSuffix:@".com"] && ![urlString hasSuffix:@".com/"]) {
         [urlString appendString:@".com/"];
     }
    
    currentURL = [NSURL URLWithString: urlString];
    [self setupWebViewURL];
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.activityIndicator setHidden: YES];

    currentURL = webView.URL;
    self.addressField.text = webView.URL.absoluteString;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    [self.activityIndicator setHidden: NO];
}

@end
