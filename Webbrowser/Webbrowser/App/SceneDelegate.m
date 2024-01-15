//
//  SceneDelegate.m
//  Webbrowser
//
//  Created by 전성훈 on 2024/01/15.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    
    // UIWindow를 생성하고 화면 크기로 초기화
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    // 초기 뷰 컨트롤러를 생성
    ViewController *VC = [[ViewController alloc]init];
    
    self.window.rootViewController = VC;
    
    [self.window makeKeyAndVisible];
}

@end
