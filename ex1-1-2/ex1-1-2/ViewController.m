//
//  ViewController.m
//  ex1-1-2
//
//  Created by ITユーザー on 2016/12/13.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  NSArray *devices = @[@"iPhone", @"iPad", @"iPod"];
  NSLog(@"%@", devices);
  
  NSDictionary *courses = @{@"IS":@"ITスペシャリスト科", @"CD":@"情報処理科", @"NT":@"パソコンネットワーク科"};
  NSLog(@"IS:%@", courses[@"IS"]);
  NSLog(@"CD:%@", courses[@"CD"]);
  NSLog(@"NT:%@", courses[@"NT"]);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
