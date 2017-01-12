//
//  Item.h
//  ex2-3-2
//
//  Created by 中西　真也 on 2017/01/12.
//  Copyright © 2017年 Nakanishi. All rights reserved.
//

#ifndef Item_h
#define Item_h

@interface Item:NSObject

@property(nonatomic) int id;
@property(nonatomic) NSString *title;
@property(nonatomic) NSString *contents;
@property(nonatomic) NSString *created;
@property(nonatomic) NSString *modified;
@property(nonatomic) NSString *limit;
@property(nonatomic) int delete_flg;

@end

#endif /* Item_h */
