//
//  AddViewController.m
//  ex2-3-2
//
//  Created by 中西　真也 on 2017/01/12.
//  Copyright © 2017年 Nakanishi. All rights reserved.
//

#import "AddViewController.h"
#import "FMDatabase.h"

@interface AddViewController ()
@property NSDateFormatter *formatter;
@property FMDatabase *db;
@property (weak, nonatomic) IBOutlet
UILabel *limitDate;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextView *content;

@property (weak, nonatomic) IBOutlet UIDatePicker *picker;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@end

@implementation AddViewController

- (void)setFMDatabase:(FMDatabase *)db {
  self.db = db;
}

- (IBAction)onSubmit:(id)sender {
  NSString *sql = @"INSERT INTO tr_todo (todo_title, todo_contents, created, modified, limit_date, delete_flg) VALUES (?, ?, ?, ?, ?, ?);";

  [self.db open];
  [self.db executeUpdate:sql, self.titleTextField.text
                            ,self.content.text
                            ,[self.formatter stringFromDate:[NSDate new]]
                            ,[self.formatter stringFromDate:[NSDate new]]
                            ,self.limitDate.text
                            ,[NSNumber numberWithInteger:0]];
  [self.db close];
  [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}

- (IBAction)onCheck:(id)sender {
  if ( [self.titleTextField.text isEqualToString: @""] ) {
    self.submitButton.enabled = NO;
  } else {
    self.submitButton.enabled = YES;
  }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  UITouch *touch = [[event allTouches] anyObject];
  if ( touch.view.tag == self.limitDate.tag ) {
    self.picker.alpha = !(self.picker.alpha);
  } else {
    self.picker.alpha = 0;
  }
  
  if ( self.titleTextField.isFirstResponder ) {
    [self.titleTextField resignFirstResponder];
  } else {
    [self.titleTextField becomeFirstResponder];
  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.limitDate.userInteractionEnabled = YES;
  self.limitDate.tag = 100;
  
  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

  self.formatter = [NSDateFormatter new];
  self.formatter.calendar = calendar;
  self.formatter.dateFormat = @"YYYY-MM-dd";
  self.picker.calendar = calendar;
  self.picker.alpha = 0;
  [self.picker addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
  self.picker.date = [NSDate new];
  [self updateDate:self.picker];
}

- (void)updateDate:(UIDatePicker *)picker {
  NSString *dayStr = [self.formatter stringFromDate:self.picker.date];
  self.limitDate.text = dayStr;
}

@end
