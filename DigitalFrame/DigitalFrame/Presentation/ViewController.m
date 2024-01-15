//
//  ViewController.m
//  DigitalFrame
//
//  Created by 전성훈 on 2024/01/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageView, slider, startButton, speedLabel;
@synthesize imageArray, currentImageIndex, timePerImage, animationTimer;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpLayout];
    [self setupAttribute];
}

-(void)setUpLayout {
    self.imageView = [[UIImageView alloc]init];
    self.slider = [[UISlider alloc]init];
    self.startButton = [[UIButton alloc]init];
    self.speedLabel = [[UILabel alloc]init];
    
    NSArray *views = @[imageView, slider, startButton, speedLabel];
    
    for (UIView *view in views) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview: view];
    }

    [self.view addConstraints: @[
        // imageView
        [self.imageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:0],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:2],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-2],
        [self.imageView.heightAnchor constraintEqualToConstant:450],
        
        // slider
        [NSLayoutConstraint constraintWithItem:slider
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:imageView
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0 
                                      constant: 20.0
        ],
        [NSLayoutConstraint constraintWithItem:slider
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view.safeAreaLayoutGuide
                                     attribute:NSLayoutAttributeLeft 
                                    multiplier:1.0
                                      constant:16.0
        ],
        [NSLayoutConstraint constraintWithItem:slider
                                     attribute: NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:speedLabel
                                     attribute:NSLayoutAttributeLeft 
                                    multiplier:1.0
                                      constant:-16.0
        ],
        
        // startButton
        [NSLayoutConstraint constraintWithItem:startButton
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0
                                      constant:0
        ],
        [NSLayoutConstraint constraintWithItem:startButton
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:slider
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:16.0
        ],
        [NSLayoutConstraint constraintWithItem:startButton
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:60.0
        ],
        
        // speedLabel
        [NSLayoutConstraint constraintWithItem:speedLabel
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:slider
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0
        ],
        [NSLayoutConstraint constraintWithItem:speedLabel
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view.safeAreaLayoutGuide
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:-16.0
        ],
        [NSLayoutConstraint constraintWithItem:speedLabel
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:60.0
        ]
    ]];
}

-(void)setupAttribute {
    self.view.backgroundColor = [UIColor lightGrayColor];

    self.imageArray = [[NSArray alloc]initWithObjects:
                       [UIImage imageNamed:@"1"],
                       [UIImage imageNamed:@"2"],
                       [UIImage imageNamed:@"3"],
                       [UIImage imageNamed:@"4"],
                       [UIImage imageNamed:@"5"],
                       [UIImage imageNamed:@"6"],
                       [UIImage imageNamed:@"7"],
                       [UIImage imageNamed:@"8"],
                       [UIImage imageNamed:@"9"],
                       [UIImage imageNamed:@"10"],
                       [UIImage imageNamed:@"11"],
                       [UIImage imageNamed:@"12"],
                       [UIImage imageNamed:@"13"],
                       [UIImage imageNamed:@"14"],
                       [UIImage imageNamed:@"15"],
                       nil];
    
    currentImageIndex = 0;
    
    imageView.image = self.imageArray[self.currentImageIndex];
    imageView.backgroundColor = [UIColor grayColor];
    imageView.layer.cornerRadius = 12;
    imageView.clipsToBounds = YES;
        
    [startButton setTitle: @"Start" forState: UIControlStateNormal];
    [startButton addTarget:self action:@selector(startButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    timePerImage = 1;
    
    slider.minimumValue = 0.5;
    slider.maximumValue = 1.0;
    slider.value = 0.5;
    
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [slider addTarget:self action:@selector(sliderAfterValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    speedLabel.text = [NSString stringWithFormat:@"%.2f", 1.0];
}

-(void)sliderValueChanged:(UISlider *)sender {
    // 슬라이더 값의 최솟값 최대값 정의
    CGFloat minValue = 0.5;
    CGFloat maxValue = 1.0;
    
    // 슬라이더 값에 따라 역으로 간격 계산
    CGFloat newTimePerImage = maxValue - (sender.value - minValue);

    speedLabel.text = [NSString stringWithFormat:@"%.2f", newTimePerImage];
    
    self.timePerImage = newTimePerImage;
}

-(void)sliderAfterValueChanged:(UISlider *)sender {
    // 타이머가 실행 중이라면 새 간격으로 다시 시작
    if (self.animationTimer.isValid) {
        [self.animationTimer invalidate];
    }
    self.animationTimer = [
        NSTimer scheduledTimerWithTimeInterval:timePerImage
        target:self
        selector:@selector(changeImage)
        userInfo:nil
        repeats:YES
    ];
}

- (void)startButtonTapped:(UIButton *)sender {
    if (self.animationTimer.isValid) {
        [self.animationTimer invalidate];
        [startButton setTitle:@"Start" forState:UIControlStateNormal];
    } else {
        self.animationTimer = [
            NSTimer scheduledTimerWithTimeInterval:timePerImage
            target:self
            selector:@selector(changeImage)
            userInfo:nil
            repeats:YES
        ];
        
        [startButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
}

-(void)changeImage {
    self.currentImageIndex = (self.currentImageIndex + 1) % self.imageArray.count;
    self.imageView.image = self.imageArray[self.currentImageIndex];
    [self imageChangeAnimation];
}

-(void)imageChangeAnimation {
    [UIView animateWithDuration:0.25 animations:^{
        self.imageView.transform = CGAffineTransformMakeScale(0.98, 0.98);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            self.imageView.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
