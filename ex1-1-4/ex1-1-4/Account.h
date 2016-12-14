//
//  Account.h
//  ex1-1-4
//
//  Created by ITユーザー on 2016/12/14.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#ifndef Account_h
#define Account_h

@interface Account:NSObject
- (instancetype)init:(NSString *)name :(int)age :(NSString *)gender :(NSString *)lang;
- (void)print;

@property NSString *name;
@property int age;
@property NSString *gender;
@property NSString *lang;
@end

#endif /* Account_h */
