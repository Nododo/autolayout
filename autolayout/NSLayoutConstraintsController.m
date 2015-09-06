//
//  NSLayoutConstraintsController.m
//  autolayout
//
//  Created by 杜 维欣 on 15/9/2.
//  Copyright (c) 2015年 nododo. All rights reserved.
//

#import "NSLayoutConstraintsController.h"

@interface NSLayoutConstraintsController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLine;

@end

@implementation NSLayoutConstraintsController

- (void)viewDidLoad {
    [super viewDidLoad];
//    if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight) {
//        self.bottomLine.constant = - 200;
//        [self.view setNeedsLayout]; //更新视图
//        [self.view layoutIfNeeded];
//    }
    if (self.isLand) {
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
//        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeLeft) forKey:@"orientation"];
//        [[UIDevice currentDevice] setValue:@(UIDeviceOrientationLandscapeLeft)
//                                    forKey:@"orientation"];
                self.bottomLine.constant = - 200;
                [self.view setNeedsLayout]; //更新视图
                [self.view layoutIfNeeded];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"%@======%@",NSStringFromCGSize(size),coordinator);
    if (size.width == 667) {
        self.bottomLine.constant = - 200;
        [self.view setNeedsLayout]; //更新视图
        [self.view layoutIfNeeded];
    }
}

- (NSUInteger)supportedInterfaceOrientations
{
    return self.isLand == NO ? UIInterfaceOrientationMaskPortrait: UIInterfaceOrientationMaskAll;
}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return self.isLand == NO ? UIInterfaceOrientationPortrait: UIInterfaceOrientationLandscapeLeft;
}
- (IBAction)goback:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
