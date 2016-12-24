//
//  ViewController.m
//  ex2-1-9
//
//  Created by 中西　真也 on 2016/12/24.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIDatePicker *picker;

@end

@implementation ViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [[event allTouches] anyObject];
  if ( touch.view.tag == self.label.tag ) {
    self.picker.alpha = 1;
  } else {
    self.picker.alpha = 0;
  }
}

- (IBAction)onDone:(id)sender {
  self.picker.alpha = 0;
}

- (void)updateDate:(UIDatePicker *)picker {
  NSDateFormatter *formatter = [NSDateFormatter new];
  [formatter setDateFormat:@"yyyy/MM/dd"];
  NSString *dayStr = [formatter stringFromDate:self.picker.date];
  self.label.text = dayStr;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.label.userInteractionEnabled = YES;
  self.label.tag = 100;
  
  self.picker.alpha = 0;
  [self.picker addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
  self.picker.date = [NSDate new];
  [self updateDate:self.picker];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end