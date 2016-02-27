//
//  NetRequestViewController.m
//  土木男的成长
//
//  Created by 正合适 on 16/2/18.
//  Copyright © 2016年 正合适. All rights reserved.
//
/*
 <key>NSAppTransportSecurity</key>
 <dict>
 <key>NSAllowsArbitraryLoads</key><true/>
 </dict>
 */
#import "NetRequestViewController.h"

@interface NetRequestViewController ()
@property (nonatomic, strong) UITextView *showTheResultsOfNetRequest;
@end

@implementation NetRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
    
    
}
- (void)initializeUserInterface {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showTheResultsOfNetRequest];
    for (NSInteger i = 0; i < 3; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 150 + i * 70, 60, 60)];
        button.backgroundColor = [UIColor redColor];
        button.tag = i + 100;
        [button addTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}
- (void)respondsToButton:(UIButton *)sender {
    NSInteger i = sender.tag - 100;
    switch (i) {
        case 0:
            [self get1];
            break;
            case 1:
            [self get2];
            break;
            case 2:
            [self post];
            break;
            
        default:
            break;
    }
}
//get请求方法
- (void)get1 {
    NSString *urlString = @"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"%@",dic);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.showTheResultsOfNetRequest.text = @"get1网络请求成功";
            });
//            self.showTheResultsOfNetRequest.text = @"get1网络请求成功";
        } else {
//            _showTheResultsOfNetRequest.text = @"get1网络请求失败";
        }
    }];
    [task resume];
}
- (void)get2 {
    NSString *urlString = @"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"%@",dic);
            _showTheResultsOfNetRequest.text = @"get2网络请求成功";
        } else {
//            self.showTheResultsOfNetRequest.text = @"get2网络请求失败";
        }
    }];
    [task resume];
}
- (void)post {
    NSString *urlString = @"http://120.25.226.186:32812/login";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"username=520it&pwd=520it&type=JSON" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSLog(@"%@",dic[@"success"]);
            
        } else {
//            self.showTheResultsOfNetRequest.text = @"post网络请求失败";
        }
    }];
    [task resume];
}

- (UITextView *)showTheResultsOfNetRequest {
    if (!_showTheResultsOfNetRequest) {
        _showTheResultsOfNetRequest = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 60)];
        _showTheResultsOfNetRequest.textAlignment = NSTextAlignmentCenter;
//        _showTheResultsOfNetRequest.backgroundColor = [UIColor blueColor];
//        _showTheResultsOfNetRequest.text = @"111";
    }
    return _showTheResultsOfNetRequest;
}
@end
