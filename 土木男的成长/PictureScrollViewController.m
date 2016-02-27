//
//  PictureScrollViewController.m
//  土木男的成长
//
//  Created by 正合适 on 16/2/23.
//  Copyright © 2016年 正合适. All rights reserved.
//

#import "PictureScrollViewController.h"

#define WIDTH self.view.bounds.size.width
@interface PictureScrollViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *pictureNames;
@property (nonatomic, strong) UIPageControl *pageControll;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger flag;
@end

@implementation PictureScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pictureNames = @[@"轮播图片1",@"轮播图片2",@"轮播图片3"];
    NSLog(@"%lu",(unsigned long)self.pictureNames.count);
    // Do any additional setup after loading the view.
    [self initUserInterface];
}
- (void)initUserInterface {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];
    [self initScrollViewImages];
    [self.view addSubview:self.pageControll];
    [self creatNSTimer];
    
}
- (void)initScrollViewImages {
    for (NSInteger i = 0; i < self.pictureNames.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0+WIDTH*i, 0, WIDTH, 200)];
        
        imageView.tag = 1000 + i;
        if (i == 0) {
            imageView.image = [UIImage imageNamed:self.pictureNames[self.pictureNames.count-1]];
        }
        if (i == 1) {
            imageView.image = [UIImage imageNamed:self.pictureNames[0]];
        }
        if (i == 2) {
            imageView.image = [UIImage imageNamed:self.pictureNames[1]];
        }
        
        [self.scrollView addSubview:imageView];
    }
}
- (void)creatNSTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(responedTimer) userInfo:nil repeats:YES];
    
}
- (void)responedTimer {
    [self.scrollView setContentOffset:CGPointMake(WIDTH+self.scrollView.contentOffset.x, 0) animated:YES];
    NSLog(@"bofang");
}
- (void)changThePictureWithFlag:(NSInteger)flag {
    UIImageView *iamgeView0 = (UIImageView *)[self.view viewWithTag:1000];
    UIImageView *iamgeView1 = (UIImageView *)[self.view viewWithTag:1001];
    UIImageView *iamgeView2 = (UIImageView *)[self.view viewWithTag:1002];
    iamgeView1.image = [UIImage imageNamed:self.pictureNames[flag]];
    if (flag == self.pictureNames.count-1) {
        iamgeView2.image = [UIImage imageNamed:self.pictureNames[0]];
        iamgeView0.image = [UIImage imageNamed:self.pictureNames[flag - 1]];
    } else if (flag == 0) {
        iamgeView2.image = [UIImage imageNamed:self.pictureNames[flag + 1]];
        iamgeView0.image = [UIImage imageNamed:self.pictureNames[self.pictureNames.count - 1]];
    } else {
        iamgeView2.image = [UIImage imageNamed:self.pictureNames[flag + 1]];
        iamgeView0.image = [UIImage imageNamed:self.pictureNames[flag - 1]];
    }
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    if (self.scrollView.contentOffset.x > WIDTH) {
        if (self.flag == self.pictureNames.count - 1) {
            self.flag = 0;
        } else {
            self.flag ++;
        }
    } else {
        if (self.flag == 0) {
            self.flag = self.pictureNames.count - 1;
        } else {
            self.flag--;
        }
    }
    [self.scrollView setContentOffset:CGPointMake(WIDTH, 0) animated:NO];
    [self changThePictureWithFlag:self.flag];
    self.pageControll.currentPage = self.flag;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.scrollView.contentOffset.x > WIDTH) {
        if (self.flag == self.pictureNames.count - 1) {
            self.flag = 0;
        } else {
            self.flag ++;
        }
    } else {
        if (self.flag == 0) {
            self.flag = self.pictureNames.count - 1;
        } else {
            self.flag--;
        }
    }
    [self.scrollView setContentOffset:CGPointMake(WIDTH, 0) animated:NO];
    [self changThePictureWithFlag:self.flag];
    self.pageControll.currentPage = self.flag;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self creatNSTimer];
}



- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, WIDTH*self.pictureNames.count, 200)];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.contentOffset = CGPointMake(WIDTH, 0);
    }
    return _scrollView;
}
- (UIPageControl *)pageControll {
    if (!_pageControll) {
        _pageControll = [[UIPageControl alloc] init];
        _pageControll.backgroundColor = [UIColor clearColor];
        _pageControll.pageIndicatorTintColor = [UIColor blueColor];
        _pageControll.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageControll.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds), 100, 10);
    }
    return _pageControll;
}
@end
