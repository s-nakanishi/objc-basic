//
//  FavoriteProgrammingLanguage.h
//  ex1-1-5
//
//  Created by 中西　真也 on 2016/12/15.
//  Copyright © 2016年 Nakanishi. All rights reserved.
//

#ifndef FavoriteProgrammingLanguage_h
#define FavoriteProgrammingLanguage_h

@protocol FavoriteProgrammingLanguageDelegate<NSObject>
@required
- (void)canDoObj_c;
@end

@interface FavoriteProgrammingLanguage:NSObject
@property (nonatomic, assign) id<FavoriteProgrammingLanguageDelegate> delegate;
- (void)joinInternship;
@end

#endif /* FavoriteProgrammingLanguage_h */
