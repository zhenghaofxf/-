//
//  shareTools.m
//  土木男的成长
//
//  Created by 正合适 on 16/2/19.
//  Copyright © 2016年 正合适. All rights reserved.
//

#import "shareTools.h"

@implementation shareTools
+ (instancetype)shareModel {
    static shareTools *shareTool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareTool = [[shareTools alloc] init];
    });
    return shareTool;
}
@end
