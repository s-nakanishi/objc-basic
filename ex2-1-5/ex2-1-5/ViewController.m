//
//  ViewController.m
//  ex2-1-5
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIAlertController *actionSheet;
- (IBAction)onTap:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.actionSheet = [UIAlertController alertControllerWithTitle:@"メニュー"
                                                         message:@""
                                                  preferredStyle:UIAlertControllerStyleActionSheet];
  
  UIAlertAction *facebook = [UIAlertAction actionWithTitle:@"Facebook"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                     NSLog(@"selected Facebook");
                                                   }];
  [self.actionSheet addAction:facebook];

  UIAlertAction *twitter = [UIAlertAction actionWithTitle:@"Twitter"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
                                                    NSLog(@"selected Twitter");
                                                  }];
  [self.actionSheet addAction:twitter];

  UIAlertAction *line = [UIAlertAction actionWithTitle:@"Line"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                     NSLog(@"selected Line");
                                                   }];
  [self.actionSheet addAction:line];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
  [self presentViewController:self.actionSheet
                     animated:YES
                   completion:^{
                   }];
}
@end
