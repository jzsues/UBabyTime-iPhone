//
//  SearchTopTenViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SearchTopTenViewController.h"
#define TOP_BUTTON_FRAME_BASE_X 20
#define TOP_BUTTON_FRAME_BASE_Y 20
#define TOP_BUTTON_WIDTH 130
#define TOP_BUTTON_HEIGH 60
#define TOP_BUTTON_ANGLE -3

@interface SearchTopTenViewController ()

@end

@implementation SearchTopTenViewController
@synthesize scrollView=_scrollView;
- (void)dealloc
{
    [_topLabel release];
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self) {
        _topLabel = [[NSMutableArray alloc] init];
        CGRect frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT);
        _scrollView = [[[UIScrollView alloc] initWithFrame:frame] autorelease];
        UIImage *scrollViewImg = [UIImage imageNamed:@"feed-paper-texture"];
        _scrollView.backgroundColor = [UIColor colorWithPatternImage:scrollViewImg];
        
        for (int i=0; i<10; i++) {
            UIButton *topButton = [UIButton buttonWithType:UIButtonTypeCustom];
            int mod = i % 2;
            int row = i/2;

            topButton.frame = CGRectMake((TOP_BUTTON_WIDTH+10)*mod+TOP_BUTTON_FRAME_BASE_X, (TOP_BUTTON_HEIGH+15)*row+TOP_BUTTON_FRAME_BASE_Y, TOP_BUTTON_WIDTH, TOP_BUTTON_HEIGH);

            UIImage *buttonBgImg = [UIImage imageNamed:@"feed-cover-background"];
            topButton.backgroundColor = [UIColor colorWithPatternImage:buttonBgImg];
            
            [topButton setTitle:[NSString stringWithFormat:@"Top-%d",i+1] forState:UIControlStateNormal];
            [topButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];            
            
            topButton.layer.cornerRadius = 2.0f;
            topButton.layer.shadowColor = [[UIColor colorWithRed:0.02 green:0.29 blue:0.17 alpha:0.5] CGColor];
            topButton.layer.shadowOffset = CGSizeMake(5, 5);
            topButton.layer.shadowOpacity = 1.0f;

            topButton.transform = CGAffineTransformMakeRotation(TOP_BUTTON_ANGLE*(2*mod-1) * (M_PI / 180.0f));
            [_scrollView addSubview:topButton];
        }
        
        
        
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT)] autorelease];
    [view addSubview:_scrollView];    
    self.view = view;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
