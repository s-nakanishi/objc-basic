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
@property(nonatomic) NSArray *items;
@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.items.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  NSString *itemString = NSLocalizedString(self.items[indexPath.row], nil);
  NSArray *arr = [itemString componentsSeparatedByString:@"\n"];
  cell.textLabel.numberOfLines = arr.count;
  cell.textLabel.text =  itemString;
  cell.imageView.image = [UIImage imageNamed:self.items[indexPath.row]];
  return cell;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  NSBundle *bundle = [NSBundle mainBundle];
  NSString *path = [bundle pathForResource:@"item" ofType:@"plist"];
  NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
  self.items = dic[@"items"];
  
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
