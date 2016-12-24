//
//  ViewController.m
//  ex2-1-8
//
//  Created by 中西　真也 on 2016/12/24.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@end

@implementation ViewController

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [[event allTouches] anyObject];
  if ( touch.view.tag == self.label.tag ) {
    self.picker.alpha = 1;
  }
}

- (IBAction)onDone:(id)sender {
  self.picker.alpha = 0;
  NSInteger index = [self.picker selectedRowInComponent:0];
  self.label.text = self.items[index];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView{
  return 1;
}

-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
  return self.items.count;
}

-(NSString*)pickerView:(UIPickerView*)pickerView
           titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  return self.items[row];
}

- (void)updateLabel:(UIPickerView *)picker {
  NSInteger val = [self.picker selectedRowInComponent:0];
  self.label.text = self.items[val];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.items = @[@"Apple", @"Banana", @"Orange"];
  
  self.label.userInteractionEnabled = YES;
  self.label.tag = 100;

  self.picker.alpha = 0;
  self.picker.delegate = self;
  self.picker.dataSource = self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
