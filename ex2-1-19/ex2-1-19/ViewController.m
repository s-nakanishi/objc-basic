//
//  ViewController.m
//  ex2-1-19
//
//  Created by 中西　真也 on 2016/12/29.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *input;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *gesture;
- (IBAction)onTapGesture:(id)sender;
- (IBAction)onTapButton:(id)sender;

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"toSecond"]) {
    SecondViewController *second = [segue destinationViewController];
    second.receiveString = self.input.text;
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.gesture.delegate = self;
  self.gesture.numberOfTapsRequired = 1;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTapGesture:(id)sender {
  [self.input resignFirstResponder];
}

- (IBAction)onTapButton:(id)sender {
  [self.input resignFirstResponder];  
}
@end
