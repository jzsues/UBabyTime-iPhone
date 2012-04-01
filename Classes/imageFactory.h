//
//  imageFactory.h
//  SocialFusion
//
//  Created by He Ruoyun on 11-10-25.
//  Copyright (c) 2011年 TJU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFactory : NSObject

{
    ImageFactory* _imageFactory;
    NSMutableDictionary* _image;
}
-(id)init;
+(ImageFactory*)SharedImageFactory;
-(UIImage*)GetImage:(NSString*)url;
@end
