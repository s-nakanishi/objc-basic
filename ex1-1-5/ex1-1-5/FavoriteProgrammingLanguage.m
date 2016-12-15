//
//  FavoriteProgrammingLanguage.m
//  ex1-1-5
//
//  Created by 中西　真也 on 2016/12/15.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteProgrammingLanguage.h"

@implementation FavoriteProgrammingLanguage
-(void)joinInternship {
  NSLog(@"インターンに参加する");
  if ([_delegate respondsToSelector:@selector(canDoObj_c)])
  {
    [_delegate canDoObj_c];
  }
}
@end