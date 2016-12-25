//
//  ViewController.m
//  ex2-1-12
//
//  Created by 中西　真也 on 2016/12/25.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic) NSArray *items;
@end

@implementation ViewController
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  CollectionViewCell *cell = [self.collection dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
  cell.imageView.image = [UIImage imageNamed:self.items[indexPath.row]];
  return cell;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  NSBundle *bundle = [NSBundle mainBundle];
  NSString *path = [bundle pathForResource:@"item" ofType:@"plist"];
  NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
  self.items = dic[@"nigiri"];
  
  self.collection.delegate = self;
  self.collection.dataSource = self;
  UINib *nibFirst = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
  [self.collection registerNib:nibFirst forCellWithReuseIdentifier:@"customCell"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
