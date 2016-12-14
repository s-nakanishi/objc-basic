//
//  ViewController.m
//  ex1-1-3
//
//  Created by ITユーザー on 2016/12/14.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  BOOL isDone = YES;
  if (isDone) {
    NSLog(@"完了");
  }

  int age = 20;
  if (age < 20) {
    NSLog(@"未成年");
  } else {
    NSLog(@"成年");
  }
  
  int x = 15;
  int y = 25;
  if (x < y) {
    NSLog(@"xがyより小さい");
  } else if (x == y) {
    NSLog(@"xとyは等しい");
  } else {
    NSLog(@"xがyより大きい");
  }
  
  BOOL flag = NO;
  NSLog(@"%@", flag?@"Yes":@"No");
  
  int sum = 0;
  for (int i=1 ; i<=10 ; i++) {
    sum += i;
  }
  NSLog(@"1〜10の合計:%d", sum);
  
  NSArray *datas = @[@"IS", @"CD", @"NT"];
  for (NSString *data in datas) {
    NSLog(@"%@", data);
  }
  
  int level = 3;
  switch(level) {
  case 1:
    NSLog(@"レベル低");
      break;
    case 2:
      NSLog(@"レベル中");
      break;
    case 3:
      NSLog(@"レベル高");
      break;
    default:
      NSLog(@"規定外");
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
