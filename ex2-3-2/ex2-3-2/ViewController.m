//
//  ViewController.m
//  ex2-3-2
//
//  Created by 中西　真也 on 2017/01/10.
//  Copyright © 2017年 Nakanishi. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
#import "AddViewController.h"

@interface ViewController ()

@property(nonatomic) NSMutableArray *items;
@property(nonatomic) FMDatabase *db;

@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;

@property (weak, nonatomic) IBOutlet UITableView *todoList;

@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.items.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  cell.textLabel.text =  self.items[indexPath.row];
  return cell;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
  NSString *dir  = [paths objectAtIndex:0];
  self.databasePath   = [dir stringByAppendingPathComponent:@"todo.db"];
  NSLog(@"%@", self.databasePath);
  
  self.db  = [FMDatabase databaseWithPath:self.databasePath];
  
  NSString *sql = @"CREATE TABLE IF NOT EXISTS tr_todo(todo_id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT, todo_contents TEXT, created TEXT, modified TEXT, limit_date TEXT, delete_flg INTEGER); ";

  [self.db open];
  [self.db executeUpdate:sql];
  [self.db close];
  
  self.items = [NSMutableArray new];
  UIBarButtonItem *btn =
  [[UIBarButtonItem alloc]
   initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
   target:self
   action:@selector(goAddView)];
  self.navItem.rightBarButtonItem = btn;
}

- (void)viewWillAppear:(BOOL)animated {
  NSString *sql = @"SELECT * FROM tr_todo ORDER BY limit_date;";
  
  [self.db open];
  FMResultSet *results = [self.db executeQuery:sql];
  [self.items removeAllObjects];
  while( [results next] ) {
    NSString * todo_title = [results stringForColumn:@"todo_title"];
    NSString * limit_date = [results stringForColumn:@"limit_date"];
    NSString *item = [NSString stringWithFormat:@"%@ %@", limit_date, todo_title];
    [self.items addObject:item];
  }
  [self.db close];
  [self.todoList reloadData];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)goAddView {
  AddViewController *addView = [self.storyboard instantiateViewControllerWithIdentifier:@"addView"];
  [addView setFMDatabase:self.db];
  [self.navigationController pushViewController:addView animated:YES];}
@end
