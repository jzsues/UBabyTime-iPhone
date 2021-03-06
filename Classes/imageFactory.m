//
//  imageFactory.m
//  SocialFusion
//
//  Created by He Ruoyun on 11-10-25.
//  Copyright (c) 2011年 TJU. All rights reserved.
//

#import "imageFactory.h"

@implementation ImageFactory


-(id)init
{
    [super init];
    _image=[[NSMutableDictionary alloc] init];
    return self;
}


+(ImageFactory*)SharedImageFactory
{
    static ImageFactory* factory;
    if (!factory)
    {
        factory=[[ImageFactory alloc] init];
    }
    return factory;
}


-(UIImage*)GetImage:(NSString*)url
{
    UIImage* image=[_image objectForKey:url];
    if (image==nil)
    {
        image=[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
        [_image setValue:image forKey:url];
        [image release];
        image=[_image objectForKey:url];
    }
    return image;
    
}
@end
