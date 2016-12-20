//
//  ViewController.m
//  ex2-1-3
//
//  Created by ITユーザー on 2016/12/20.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)onTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property NSArray *items;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.items = @[@"ika", @"ebi", @"salmon", @"hamachi", @"maguro"];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
  int rnd = arc4random() % self.items.count;
  UIImage *backgroundImage = [UIImage imageNamed:self.items[rnd]];
  [self.btn setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}
@end
