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
#import "item.h"

@interface ViewController ()

@property(nonatomic) NSMutableArray<Item *> *items;
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
      NSString *item = [NSString stringWithFormat:@"%@ %@", self.items[indexPath.row].limit, self.items[indexPath.row].title];
  cell.textLabel.text = item;
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
  
  self.items = [NSMutableArray<Item *> new];
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
    int deleteFlag = [results intForColumn:@"delete_flg"];
    if ( deleteFlag==0 ) {
      Item *item = [Item alloc];
      item.id = [results intForColumn:@"todo_id"];
      item.title = [results stringForColumn:@"todo_title"];
      item.contents = [results stringForColumn:@"todo_contents"];
      item.created = [results stringForColumn:@"created"];
      item.modified = [results stringForColumn:@"modified"];
      item.limit = [results stringForColumn:@"limit_date"];
      item.limit = [results stringForColumn:@"limit_date"];
      
      [self.items addObject:item];
    }
  }
  [self.db close];
  [self.todoList reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return @[[UITableViewRowAction rowActionWithStyle: UITableViewRowActionStyleDestructive
      title:@"Delete"
      handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self.items removeObjectAtIndex:indexPath.row];
        [self.todoList deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        NSString *sql = @"UPDATE tr_todo SET delete_flg=1 WHERE todo_title=?; ";
        
        [self.db open];
        [self.db executeUpdate:sql, self.items[indexPath.row].title];
        [self.db close];
      }]];
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
