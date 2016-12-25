//
//  ViewController.m
//  ex2-1-11
//
//  Created by 中西　真也 on 2016/12/25.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property(nonatomic) NSArray *sections;
@property(nonatomic) NSArray *sectionTitles;
@end

@implementation ViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  
  return self.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  return self.sectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSArray *items = self.sections[section];
  return items.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  NSArray *items = self.sections[indexPath.section];
  NSString *itemString = NSLocalizedString(items[indexPath.row], nil);
  NSArray *arr = [itemString componentsSeparatedByString:@"\n"];
  cell.textLabel.numberOfLines = arr.count;
  cell.textLabel.text =  itemString;
  cell.imageView.image = [UIImage imageNamed:items[indexPath.row]];
  return cell;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  NSBundle *bundle = [NSBundle mainBundle];
  NSString *path = [bundle pathForResource:@"item" ofType:@"plist"];
  NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
  self.sections = @[dic[@"nigiri"], dic[@"side"]];
  self.sectionTitles = @[@"にぎりメニュー", @"サイドメニュー"];
  
  self.table.delegate = self;
  self.table.dataSource = self;
  self.table.estimatedRowHeight = 10;
  self.table.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
