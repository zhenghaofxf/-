//
//  SlideScrollViewController.m
//  土木男的成长
//
//  Created by 正合适 on 16/2/24.
//  Copyright © 2016年 正合适. All rights reserved.
//

#import "SlideScrollViewController.h"

#define BUTTON_WIDTH self.view.bounds.size.width/4
#define SCREEN_WIDTH self.view.bounds.size.width
#define BUTTON_HEIGHT 64
@interface SlideScrollViewController ()<UIScrollViewDelegate>
@property (nonatomic, assign) NSInteger currentCount;
@property (nonatomic, strong) UIScrollView *topScrollView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *tableViews;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) UIView *sliderView;
@end

@implementation SlideScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initTopScrollView];
    [self initTables];
    
}
- (void)initData {
    self.data = [[NSMutableArray alloc] initWithCapacity:4];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSInteger i = 0; i < 4; i ++) {
        for (NSInteger a = 0; a < 20; a ++) {
            NSString *string = [NSString stringWithFormat:@"第%ld页第%ld行",i,a];
            [temp addObject:string];
        }
        [self.data addObject:temp];
    }
}
- (void)initTables {
    self.tableViews = [[NSMutableArray alloc] initWithCapacity:2];
    for (NSInteger i = 0; i < 2; i ++) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.bounds.size.height-64-BUTTON_HEIGHT)];
        tableView.rowHeight = 20;
        tableView.tag = i + 200;
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.tableViews addObject:tableView];
        [self.scrollView addSubview:tableView];
    }
}
- (void)initTopScrollView {
    NSArray *names = @[@"第一页",@"第二页",@"第三页",@"第四页"];
    [self.view addSubview:self.topScrollView];
    for (NSInteger i = 0; i < 4; i ++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0+i*BUTTON_WIDTH, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
        [button setTitle:names[i] forState:UIControlStateNormal];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(responedToButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.topScrollView addSubview:button];
    }
}
- (void)responedToButton:(UIButton *)sender {
    self.currentCount = sender.tag-100;
    [self.topScrollView setContentOffset:CGPointMake(BUTTON_WIDTH*self.currentCount, 0) animated:YES];
}
- (void)updateTableViewWithPageNumber:(NSInteger)pageNumber {
    NSInteger flag = pageNumber%2;
    UITableView *tableView = self.tableViews[flag];
    tableView.frame = CGRectMake(pageNumber*SCREEN_WIDTH, 0, SCREEN_WIDTH, self.view.bounds.size.height-64-BUTTON_HEIGHT);
    [tableView reloadData];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.topScrollView]) {
        
    }
}




-(UIScrollView *)topScrollView {
    if (!_topScrollView) {
        _topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, BUTTON_HEIGHT)];
        _topScrollView.delegate = self;
        _topScrollView.backgroundColor = [UIColor whiteColor];
        _topScrollView.bounces = NO;
        _topScrollView.showsVerticalScrollIndicator = NO;
        _topScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _topScrollView;
}
- (UIView *)sliderView {
    if (!_sliderView) {
        _sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, self.topScrollView.bounds.size.height - 5, BUTTON_WIDTH, 5)];
        _sliderView.backgroundColor = [UIColor redColor];
    }
    return _sliderView;
}
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + BUTTON_HEIGHT, SCREEN_WIDTH, self.view.bounds.size.height-64-BUTTON_HEIGHT)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*4, self.view.bounds.size.height-64-BUTTON_HEIGHT);
        _scrollView.delegate = self;
    }
    return _scrollView;
}
@end
