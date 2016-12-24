//
//  ViewController.m
//  ex2-1-7
//
//  Created by 中西　真也 on 2016/12/24.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController
- (IBAction)onTap:(id)sender {
  [self.textField resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
  int maxInputLength = 30;
  
  NSMutableString *str = [textField.text mutableCopy];
  
  [str replaceCharactersInRange:range withString:string];
  
  if ([str length] > maxInputLength) {
    return NO;
  }
  
  return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.textField.delegate = self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
