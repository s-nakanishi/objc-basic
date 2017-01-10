//
//  ViewController.m
//  ex2-3-2
//
//  Created by 中西　真也 on 2017/01/10.
//  Copyright © 2017年 Nakanishi. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
  NSString *dir  = [paths objectAtIndex:0];
  self.databasePath   = [dir stringByAppendingPathComponent:@"todo.db"];
  NSLog(@"%@", self.databasePath);
  
  FMDatabase *db  = [FMDatabase databaseWithPath:self.databasePath];
  
  NSString *sql = @"CREATE TABLE tr_todo(todo_id INTEGER PRIMARY KEY, todo_title TEXT, todo_contents TEXT, created TEXT, modified TEXT, limit_date TEXT, delete_flg INTEGER); ";
  
  [db open];
  [db executeUpdate:sql];
  [db close];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
