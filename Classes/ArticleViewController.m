//
//  ArticleViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ArticleViewController.h"

@implementation ArticleViewController
@synthesize backButton = _backButton;
@synthesize favourButton = _favourButton;
@synthesize commentButton = _commentButton;
@synthesize otherButton = _otherButton;
@synthesize articleView = _articleView;
- (void)dealloc
{
    [_backButton release];
    [_favourButton release];
    [_commentButton release];
    [_otherButton release];
    [_articleView release];
    [super dealloc];
}
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
    self.articleView =[views lastObject];
    
    _articleView.contentSize = CGSizeMake(_articleView.frame.size.width, _articleView.imageView.frame.size.height+_articleView.titleLabel.frame.size.height+_articleView.textView.frame.size.height);
    
    [self.view  addSubview: _articleView];
    [self.view bringSubviewToFront:_articleView];
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
    self.favourButton = nil;
    self.commentButton = nil;
    self.otherButton = nil;
    self.backButton = nil;
    self.articleView = nil;
}

#pragma mark - IBAction

-(IBAction)backButtonClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
