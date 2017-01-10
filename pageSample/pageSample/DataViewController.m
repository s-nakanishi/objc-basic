//
//  DataViewController.m
//  PageSample
//
//  Created by 中西　真也 on 2016/12/30.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.dataLabel.text = [self.dataObject description];
}

@end
