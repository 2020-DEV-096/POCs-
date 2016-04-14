//
//  UIAlertController+MyAdditions.h
//  AlertController Trial
//
//  Created by Sameeran Sarangi on 15/04/16.
//  Copyright © 2016 Sameeran Sarangi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (MyAdditions)
@property(nonatomic,strong) UIWindow *alertWindow;

-(void)show;
@end
