//
//  ViewController.m
//  土木男的成长
//
//  Created by 正合适 on 16/2/18.
//  Copyright © 2016年 正合适. All rights reserved.
//

#import "ViewController.h"
#import "NetRequestViewController.h"
#import "RotationAnimationViewController.h"
#import "ScrollViewController.h"
#import "PictureScrollViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NetRequestViewController *netRequestVC;
@property (nonatomic, strong) RotationAnimationViewController *rotationVC;
@property (nonatomic, strong) ScrollViewController *scrollVC;
@property (nonatomic, strong) PictureScrollViewController *pictureScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self.view addSubview:self.tableView];
    
}
- (void)initData {
    _names = @[@"Ios9网络请求",@"无限循环旋转动画",@"scrollView",@"图片轮播"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _names.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"identifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.text = _names[indexPath.row];
        
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self presentViewController:self.netRequestVC animated:YES completion:nil];
            break;
            case 1:
            [self presentViewController:self.rotationVC animated:YES completion:nil];
            break;
            case 2:
            [self presentViewController:self.scrollVC animated:YES completion:nil];
            break;
            case 3:
            [self presentViewController:self.pictureScrollView animated:YES completion:nil];
            break;
        default:
            break;
    }
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}
- (PictureScrollViewController *)pictureScrollView {
    if (!_pictureScrollView) {
        _pictureScrollView = [[PictureScrollViewController alloc] init];
    }
    return _pictureScrollView;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 40;
    }
    return _tableView;
}
- (NetRequestViewController *)netRequestVC {
    if (!_netRequestVC) {
        _netRequestVC = [[NetRequestViewController alloc] init];
    }
    return _netRequestVC;
}
- (RotationAnimationViewController *)rotationVC {
    if (!_rotationVC) {
        _rotationVC = [[RotationAnimationViewController alloc] init];
    }
    return _rotationVC;
}
- (ScrollViewController *)scrollVC {
    if (!_scrollVC) {
        _scrollVC = [[ScrollViewController alloc] init];
    }
    return _scrollVC;
}
@end
