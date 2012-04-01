//
//  ArticleView.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArticleView.h"

@implementation ArticleView
@synthesize imageView = _imageView;
@synthesize textView = _textView;
@synthesize titleLabel = _titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"ArticleView initWithCoder");
    }
    return self;
}

- (void)dealloc
{
    [_textView release];
    [_imageView release];
    [_titleLabel release];
    [super dealloc];
}



@end
