//
//  PregnacyDaliyTips.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PregnacyDaliyTips : NSObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * tips_key;
@property (nonatomic, retain) NSString * tips_data;
@property (nonatomic, retain) NSNumber * tips_data_index;
@property (nonatomic, retain) NSNumber * tips_day;

@end
