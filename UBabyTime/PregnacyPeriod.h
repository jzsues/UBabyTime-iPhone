//
//  PregnacyPeriod.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface PregnacyPeriod : NSObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSDate * begin_date;
@property (nonatomic, retain) NSDate * due_date;

@end
