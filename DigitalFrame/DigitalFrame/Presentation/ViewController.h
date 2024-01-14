//
//  ViewController.h
//  DigitalFrame
//
//  Created by 전성훈 on 2024/01/12.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UILabel *speedLabel;

@property (nonatomic, strong) NSArray<UIImage *> *imageArray;
@property (nonatomic) NSInteger currentImageIndex;
@property (nonatomic) CGFloat timePerImage;
@property (nonatomic) NSTimer *animationTimer;

-(void)sliderValueChanged:(UISlider *)sender;
-(void)startButtonTapped:(UIButton *)sender;

-(void)changeImage;
-(void)imageChangeAnimation;

@end
