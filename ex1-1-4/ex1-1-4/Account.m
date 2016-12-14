//
//  Account.m
//  ex1-1-4
//
//  Created by ITユーザー on 2016/12/14.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@implementation Account
- (instancetype)init:(NSString *)name :(int)age :(NSString *)gender :(NSString *)lang {
  self = [super init];
  if (self) {
    _name = name;
    _age = age;
    _gender = gender;
    _lang = lang;
  }
  return self;
}
- (void)print {
  if ([@"男性" isEqualToString:_gender]) {
    NSLog(@"%@君は、%@が得意な%d歳です。",_name ,_lang ,_age);
  } else {
    NSLog(@"%@さんは、%@が得意な%d歳です。",_name ,_lang ,_age);
  }
}

@end