//
//  ViewController.m
//  ex1_1_1
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
  BOOL isDone = YES;
  NSLog(@"%d", isDone);
  NSString *str = @"Hello World";
  NSLog(@"%@", str);
  NSInteger num = 7;
  NSLog(@"%ld", num);
  float f = 3.14f;
  NSLog(@"%.2f", f);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
