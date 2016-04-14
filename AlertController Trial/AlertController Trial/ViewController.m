//
//  ViewController.m
//  AlertController Trial
//
//  Created by Sameeran Sarangi on 15/04/16.
//  Copyright © 2016 Sameeran Sarangi. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertController+MyAdditions.h"

@interface ViewController ()
@property(nonatomic,strong) UIAlertController *alert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)clicked:(id)sender {
    self.alert = [UIAlertController alertControllerWithTitle:@"Hi" message:@"Test Alert" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Ok Selected");
    }];
    [self.alert addAction:okAction];
    
    // to hide the alert automatically
    [UIView animateWithDuration:0 animations:^{
        [self.alert show];
    } completion:^(BOOL finished) {
        [self performSelector:@selector(dismissAlert) withObject:nil afterDelay:2];
    }];
}

-(void)dismissAlert
{
    if (self.alert) {
        [self.alert hide];
    }
    
}

@end
