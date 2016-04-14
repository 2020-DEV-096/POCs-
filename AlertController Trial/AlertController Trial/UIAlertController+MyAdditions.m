//
//  UIAlertController+MyAdditions.m
//  AlertController Trial
//
//  Created by Sameeran Sarangi on 15/04/16.
//  Copyright © 2016 Sameeran Sarangi. All rights reserved.
//

#import "UIAlertController+MyAdditions.h"
#import <objc/runtime.h>

@implementation UIAlertController (MyAdditions)

@dynamic alertWindow;

- (void)setAlertWindow:(UIWindow *)alertWindow {
    objc_setAssociatedObject(self, @selector(alertWindow), alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)alertWindow {
    return objc_getAssociatedObject(self, @selector(alertWindow));
}

- (void)show {
    self.alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.alertWindow.rootViewController = [[UIViewController alloc] init];

    // window level = topmost + 1
    UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
    self.alertWindow.windowLevel = topWindow.windowLevel + 1;
    
    [self.alertWindow makeKeyAndVisible];
    [self.alertWindow.rootViewController presentViewController:self animated:YES completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // just to ensure the window gets desroyed
    self.alertWindow.hidden = YES;
    self.alertWindow = nil;
}

@end
