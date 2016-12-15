//
//  ViewController.m
//  ex1-1-5
//
//  Created by 中西　真也 on 2016/12/15.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  Account *account = [[Account alloc] init:@"今田 雄太" :21 :@"男性" : @"C言語"];
  [account doAction];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
