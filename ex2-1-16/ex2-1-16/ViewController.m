//
//  ViewController.m
//  ex2-1-16
//
//  Created by 中西　真也 on 2016/12/29.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (nonatomic) UIViewController *page1;
@property (nonatomic) UIViewController *page2;
@property (nonatomic) UIViewController *page3;
@property (nonatomic) NSArray *pages;

@property NSInteger currentPageIndex;

@end

@implementation ViewController

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
  if (self.currentPageIndex <= 0) {
    return nil;
  }
  
  self.currentPageIndex--;
  
  return self.pages[self.currentPageIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
  if (self.currentPageIndex >= 2) {
    return nil;
  }
  
  self.currentPageIndex++;

  return self.pages[self.currentPageIndex];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                            navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                          options:nil];
  
  self.pageViewController.dataSource = self;
  self.pageViewController.delegate = self;
  
  self.page1 = [self.storyboard instantiateViewControllerWithIdentifier:@"Page1"];
  self.page2 = [self.storyboard instantiateViewControllerWithIdentifier:@"Page2"];
  self.page3 = [self.storyboard instantiateViewControllerWithIdentifier:@"Page3"];
  self.pages = @[self.page1, self.page2, self.page3];

  NSArray *viewControllers = @[self.page1];
  [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
  
  // UIPageViewControllerのサイズを変更（UIPageControlを上に表示する為）
  self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
  
  [self addChildViewController:self.pageViewController];
  [self.view addSubview:self.pageViewController.view];
  [self.pageViewController didMoveToParentViewController:self];
  
  //ページコントロール（色を変更する）
  UIPageControl* proxy = [UIPageControl appearanceWhenContainedIn:[self.pageViewController class], nil];
  
  [proxy setPageIndicatorTintColor:[UIColor lightGrayColor]];
  [proxy setCurrentPageIndicatorTintColor:[UIColor blackColor]];
  [proxy setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
