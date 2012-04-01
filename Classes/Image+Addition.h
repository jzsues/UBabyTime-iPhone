//
//  Image.h
//  SocialFusion
//
//  Created by 王紫川 on 11-9-14.
//  Copyright (c) 2011年 Tongji Apple Club. All rights reserved.
//

#import "Image.h"
#import "ImageData.h"

@interface Image (Addition)

+ (Image *)imageWithURL:(NSString *)url;
+ (Image *)insertImage:(NSData *)data withURL:(NSString *)url;

@end
