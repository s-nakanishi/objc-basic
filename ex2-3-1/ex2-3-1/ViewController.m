//
//  ViewController.m
//  ex2-3-1
//
//  Created by 中西　真也 on 2017/01/10.
//  Copyright © 2017年 Nakanishi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.db = [NSUserDefaults standardUserDefaults];
  [self.db setInteger:100 forKey:@"KEY_I"];
  [self.db setDouble:3.14 forKey:@"KEY_F"];
  [self.db setObject:@"文字" forKey:@"KEY_S"];
  [self.db synchronize];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
