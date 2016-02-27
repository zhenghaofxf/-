//
//  ScrollViewController.m
//  土木男的成长
//
//  Created by 正合适 on 16/2/18.
//  Copyright © 2016年 正合适. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *view1;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}
- (void)initializeUserInterface {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.view1];
}

//scrollView缩放
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.view1;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    self.view1.frame = CGRectMake(50, 50, 50, 50);
}



- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
        _scrollView.backgroundColor = [UIColor grayColor];
        _scrollView.delegate = self;
        _scrollView.maximumZoomScale = 3;
        _scrollView.minimumZoomScale = 0.3;
    }
    return _scrollView;
}
- (UIView *)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
        _view1.backgroundColor = [UIColor redColor];
        
    }
    return _view1;
}
@end
