//
//  RotationAnimationViewController.m
//  土木男的成长
//
//  Created by 正合适 on 16/2/18.
//  Copyright © 2016年 正合适. All rights reserved.
//

#import "RotationAnimationViewController.h"

@interface RotationAnimationViewController ()
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@end

@implementation RotationAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self rotationAnimationStar];
    [self rotationAnimationStare2];
}
- (void)rotationAnimationStar {
//    [UIView animateWithDuration:1 animations:^{
//        self.view1.transform = CGAffineTransformRotate(self.view.transform, M_PI);
//    } completion:^(BOOL finished) {
//        [self rotationAnimationStar];
//    }];
    [UIView animateWithDuration:1 delay:5 options:UIViewAnimationOptionCurveLinear animations:^{
//        self.view1.transform = CGAffineTransformRotate(self.view.transform, M_PI);
        self.view1.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        [self rotationAnimationStar];
    }];
}
- (void)rotationAnimationStare2 {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animation.keyPath = @"transform.rotation.z";
    animation.toValue = [NSNumber numberWithFloat:M_PI *2.0];
    animation.repeatCount = MAXFLOAT;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
//    animation.cumulative = YES;
    animation.duration = 1;
    [self.view2.layer addAnimation:animation forKey:nil];
    
}
- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
//        _view1.layer.cornerRadius = 25;
        _view1.layer.backgroundColor = [UIColor redColor].CGColor;
    }
    return _view1;
}
- (UIView *)view2 {
    if (!_view2) {
        _view2 = [[UIView alloc] initWithFrame:CGRectMake(150, 50, 50, 50)];
//        _view2.layer.cornerRadius = 25;
        _view2.layer.backgroundColor = [UIColor blueColor].CGColor;
    }
    return _view2;
}
- (UIView *)view3 {
    if (!_view3) {
        _view3 = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
//        _view3.layer.cornerRadius = 25;
        _view3.layer.backgroundColor = [UIColor grayColor].CGColor;
    }
    return _view3;
}
@end
