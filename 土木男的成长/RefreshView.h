//
//  RefreshView.h
//  土木男的成长
//
//  Created by 正合适 on 16/2/27.
//  Copyright © 2016年 正合适. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    refreshViewTypeHeader,
    refreshViewTypeFooter
}RefreshViewType;
typedef enum {
    refreshViewStateDragToRefresh,
    refreshViewStateLooseToRefresh,
    RefreshViewStateRefreshing
}RefreshViewState;
@interface RefreshView : UIView
@property (nonatomic, assign) RefreshViewState refreshState;
- (instancetype)initWithFrame:(CGRect)frame WithRefreshType:(RefreshViewType)refreshType;
- (void)getCurrentDate;
@end
