//
//  ViewController.m
//  ex1-1-4
//
//  Created by ITユーザー on 2016/12/14.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#import "ViewController.h"
#import "Account.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  Account *account1 = [[Account alloc] init:@"今田 雄太" :21 :@"男性" : @"C言語"];
  Account *account2 = [[Account alloc] init:@"三木 龍之介" :21 :@"男性" : @"Java"];
  Account *account3 = [[Account alloc] init:@"望月 麻衣" :20 :@"女性" : @"Swift"];

  NSArray *accounts = @[account1, account2, account3];
  for (Account *item in accounts) {
    [item print];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
