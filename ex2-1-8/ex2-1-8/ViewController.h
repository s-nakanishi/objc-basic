//
//  ViewController.h
//  ex2-1-8
//
//  Created by 中西　真也 on 2016/12/24.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
@property(nonatomic) NSArray *items;
@end

