//
//  ViewController.m
//  ex2-1-13
//
//  Created by 中西　真也 on 2016/12/28.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "CollectionSection.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (nonatomic) NSArray<NSArray *> *items;
@property (nonatomic) NSArray *sectionTitles;
@end

@implementation ViewController
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.items[section].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  CollectionViewCell *cell = [self.collection dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
  cell.imageView.image = [UIImage imageNamed:self.items[indexPath.section][indexPath.row]];
  return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return self.sectionTitles.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
  CollectionSection *header = [self.collection dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"customSection" forIndexPath:indexPath];
  header.title.text = self.sectionTitles[indexPath.section];
  return header;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  NSBundle *bundle = [NSBundle mainBundle];
  NSString *path = [bundle pathForResource:@"item" ofType:@"plist"];
  NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
  self.items = @[dic[@"nigiri"], dic[@"side"]];
  
  self.sectionTitles = @[@"にぎりメニュー", @"サイドメニュー"];
  
  self.collection.delegate = self;
  self.collection.dataSource = self;
  
  UINib *nibCell = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
  [self.collection registerNib:nibCell forCellWithReuseIdentifier:@"customCell"];

  UINib *nibSection = [UINib nibWithNibName:@"CollectionSection" bundle:nil];
  [self.collection registerNib:nibSection forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"customSection" ];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end