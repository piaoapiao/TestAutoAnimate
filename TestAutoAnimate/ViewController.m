//
//  ViewController.m
//  TestAutoAnimate
//
//  Created by guodong on 15/8/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    NSLog(@"%s",__func__);
    if(self.bottomView.frame.origin.y >= self.view.frame.size.height)
    {
        [self replacePickerContainerViewTopConstraintWithConstant:0];
        [UIView animateWithDuration:0.25 animations:^{
          [self.view layoutIfNeeded];
        }];
    }
    else
    {
        [self replacePickerContainerViewTopConstraintWithConstant:-200];
        [UIView animateWithDuration:0.25 animations:^{
          [self.view layoutIfNeeded];
        }];
    }
}

- (void)replacePickerContainerViewTopConstraintWithConstant:(CGFloat)constant
{
    for (NSLayoutConstraint *constraint in self.bottomView.superview.constraints) {
        if (constraint.firstItem == self.bottomView.superview && constraint.firstAttribute == NSLayoutAttributeBottom) {
          NSLog(@"constraint:%@",constraint);
            constraint.constant = constant;
        }
    }
}
@end
