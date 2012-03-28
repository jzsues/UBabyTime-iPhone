//
//  ArticleViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArticleViewController.h"

@implementation ArticleViewController
@synthesize controllerDelegate = _controllerDelegate;
@synthesize backButton = _backButton;
@synthesize favourButton = _favourButton;
@synthesize commentButton = _commentButton;
@synthesize otherButton = _otherButton;

-(id)init{
    if (self=[super initWithNibName:@"ArticleViewController" bundle:nil]) {
        self.view.frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT);
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *views =  [[NSBundle mainBundle] loadNibNamed:@"ArticleView" owner:nil options:nil];
    ArticleView * articleView =[views lastObject];
    
    articleView.contentSize = CGSizeMake(articleView.frame.size.width, articleView.imageView.frame.size.height+articleView.titleLabel.frame.size.height+articleView.textView.frame.size.height);
    
    [self.view  addSubview: articleView];
    [self.view bringSubviewToFront:articleView];
    [self.view bringSubviewToFront:_favourButton];
    [self.view bringSubviewToFront:_commentButton];
    [self.view bringSubviewToFront:_otherButton];
    [self.view bringSubviewToFront:_backButton];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - IBAction

-(IBAction)backButtonClick:(id)sender{
    [_controllerDelegate backButtonClick:sender];
}

@end
