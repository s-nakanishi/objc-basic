//
//  RootViewController.h
//  pageSample
//
//  Created by 中西　真也 on 2016/12/29.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

