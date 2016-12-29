//
//  ViewController.m
//  ex2-1-16
//
//  Created by 中西　真也 on 2016/12/29.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import "ViewController.h"
#import "Page.h"

@interface ViewController ()
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property NSInteger currentPageIndex;

@end

@implementation ViewController

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
  if (self.currentPageIndex <= 0) {
    return nil;
  }
  
  self.currentPageIndex--;
  
  NSArray *viewControllers = [self.pageViewController viewControllers];
  return viewControllers[self.currentPageIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
  if (self.currentPageIndex >= 2) {
    return nil;
  }
  
  self.currentPageIndex++;

  NSArray *viewControllers = [self.pageViewController viewControllers];
  return viewControllers[self.currentPageIndex];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                            navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                          options:nil];
  
  self.pageViewController.dataSource = self;
  self.pageViewController.delegate = self;
  
  Page *page1 = [[Page alloc] initWithNibName:@"Page" bundle:[NSBundle mainBundle]];
//  page1.pageNumber.text = @"1/3";

  Page *page2 = [[Page alloc] initWithNibName:@"Page" bundle:[NSBundle mainBundle]];
//  page2.pageNumber.text = @"2/3";
  
  Page *page3 = [[Page alloc] initWithNibName:@"Page" bundle:[NSBundle mainBundle]];
//  page3.pageNumber.text = @"3/3";
  
  NSArray *viewControllers = @[page1, page2, page3];
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
