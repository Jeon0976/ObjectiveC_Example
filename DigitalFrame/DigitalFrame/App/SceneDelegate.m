//
//  SceneDelegate.m
//  DigitalFrame
//
//  Created by 전성훈 on 2024/01/12.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    
    // UIWindow를 생성하고 화면 크기로 초기화
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];

    // 초기 뷰 컨트롤러를 생성
    ViewController *VC = [[ViewController alloc]init];
    
    // UINavigationController
    UINavigationController *rootVC = [[UINavigationController alloc] initWithRootViewController: VC];
    
    self.window.rootViewController = rootVC;
    
    [self.window makeKeyAndVisible];

}

@end
