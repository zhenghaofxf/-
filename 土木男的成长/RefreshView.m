//
//  RefreshView.m
//  土木男的成长
//
//  Created by 正合适 on 16/2/27.
//  Copyright © 2016年 正合适. All rights reserved.
//

#import "RefreshView.h"

@interface RefreshView ()
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *stateLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, assign) RefreshViewType refreshType;
@end
@implementation RefreshView
- (instancetype)initWithFrame:(CGRect)frame WithRefreshType:(RefreshViewType)refreshType {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.refreshType = refreshType;
        switch (refreshType) {
            case refreshViewTypeHeader:
                self.stateLabel.frame = CGRectMake(150, 10, 100, 20);
                self.stateLabel.text = @"下拉刷新";
                self.timeLabel.frame = CGRectMake(150, 35, 100, 20);
                self.timeLabel.text = [self getCurrentData:[NSDate date]];
                self.arrowImageView.frame = CGRectMake(100, 10, 20, 40);
                self.arrowImageView.layer.transform = CATransform3DMakeRotation(M_PI, 0.0f, 0.0f, 1.0f);
                self.activityIndicatorView.frame = CGRectMake(110, 10, 20, 20);
                [self addSubview:self.timeLabel];
                break;
                case refreshViewTypeFooter:
                self.stateLabel.frame = CGRectMake(150, 10, 100, 20);
                self.stateLabel.text = @"上拉刷新";
                self.activityIndicatorView.frame = CGRectMake(110, 10, 20, 20);
                break;
            default:
                break;
        }
        [self addSubview:self.stateLabel];
        [self addSubview:self.activityIndicatorView];
        [self addSubview:self.arrowImageView];
        
    }
    return self;
}


#pragma mark privite method
- (NSString *)getCurrentData:(NSDate *)date {
    if (date) {
        date = [NSDate date];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *time = [formatter stringFromDate:date];
        return time;
    } else {
        return @"从未更新";
    }
}
- (void)getCurrentDate {
    self.timeLabel.text = [self getCurrentData:[NSDate date]];
}
#pragma mark getter
- (void)setRefreshState:(RefreshViewState)refreshState {
    switch (refreshState) {
        case refreshViewStateDragToRefresh:
            switch (self.refreshType) {
                case refreshViewTypeHeader:
                    self.stateLabel.text = @"下拉刷新";
                    break;
                case refreshViewTypeFooter:
                    self.stateLabel.text = @"上拉刷新";
                    break;
                default:
                    break;
            }
            break;
            case refreshViewStateLooseToRefresh:
            self.stateLabel.text = @"松开刷新";
            break;
            case RefreshViewStateRefreshing:
            self.stateLabel.text = @"刷新中";
            break;
        default:
            break;
    }
}
- (void)startActivityViewAnimation {
    [self.activityIndicatorView startAnimating];
    [self.arrowImageView setHidden:YES];
}
- (void)stopActivityViewAnimation {
    [self.activityIndicatorView stopAnimating];
    [self.activityIndicatorView setHidden:YES];
    [self.arrowImageView setHidden:NO];
}
- (void)startArrowAnimation {
    [UIView animateWithDuration:1 animations:^{
        self.arrowImageView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
    }];
}
#pragma mark setter
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor whiteColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLabel;
}
- (UILabel *)stateLabel {
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.backgroundColor = [UIColor whiteColor];
        _stateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _stateLabel;
}
- (UIActivityIndicatorView *)activityIndicatorView {
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicatorView.hidesWhenStopped = YES;
    }
    return _activityIndicatorView;
}
- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_up"]];
        _arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _arrowImageView;
}
@end
