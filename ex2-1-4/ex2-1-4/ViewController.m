//
//  ViewController.m
//  ex2-1-4
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIAlertController *alert;
- (IBAction)onTap:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.alert = [UIAlertController alertControllerWithTitle:@"確認"
                                                   message:@"実行します"
                                            preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                               style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction *action) {
                                               NSLog(@"clicked OK Button");
                                             }];
  [self.alert addAction:ok];

  UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                   style:UIAlertActionStyleCancel
                                                 handler:^(UIAlertAction *action) {
                                                   NSLog(@"clicked Cancel Button");
                                                 }];
  [self.alert addAction:cancel];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
  [self presentViewController:self.alert
                     animated:YES
                   completion:^{
                     NSLog(@"show Alert");
                   }];
}
@end
