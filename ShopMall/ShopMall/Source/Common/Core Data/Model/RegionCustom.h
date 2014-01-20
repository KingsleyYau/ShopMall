//
//  RegionCustom.h
//  DrPalm
//
//  Created by KingsleyYau on 13-3-3.
//  Copyright (c) 2013年 KingsleyYau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Region.h"
@interface Region(Custom)
+ (NSNumber *)idWithDict:(NSDictionary *)dict;
- (void)updateWithDict:(NSDictionary *)dict;
@end
