//
//  ImageData.h
//  SocialFusion
//
//  Created by He Ruoyun on 11-11-18.
//  Copyright (c) 2011年 Tongji Apple Club. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Image;

@interface ImageData : NSObject

@property (nonatomic, retain) NSData * data;
@property (nonatomic, retain) Image *owner;

@end
