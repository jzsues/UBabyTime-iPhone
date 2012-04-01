//
//  SearchTopTenViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SearchTopTenViewController.h"
#define TOP_BUTTON_FRAME_BASE_X 20
#define TOP_BUTTON_FRAME_BASE_Y 65
#define TOP_BUTTON_WIDTH 130
#define TOP_BUTTON_HEIGH 50
#define TOP_BUTTON_ANGLE -1

@interface SearchTopTenViewController ()

@end

@implementation SearchTopTenViewController
@synthesize scrollView=_scrollView;
- (void)dealloc
{
    [_scrollView release];
    [_topLabels release];
    [super dealloc];
}
- (id)init
{
    self = [super init];
    if (self) {
        _topLabels = [[NSMutableArray alloc] init];
        CGRect frame = CGRectMake(0, 0, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT);
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        UIImage *scrollViewImg = [UIImage imageNamed:@"feed-paper-texture"];
        _scrollView.backgroundColor = [UIColor colorWithPatternImage:scrollViewImg];
        
        for (int i=0; i<10; i++) {
            int random = arc4random() % 100;
            
            UIButton *topButton = [UIButton buttonWithType:UIButtonTypeCustom];

            topButton.frame = CGRectMake((2*(random%2)-1)*400*(random%5+1), (2*(random%2)-1)*500*(random%5+1), TOP_BUTTON_WIDTH, TOP_BUTTON_HEIGH);

            UIImage *buttonBgImg = [UIImage imageNamed:@"feed-cover-background"];
            topButton.backgroundColor = [UIColor colorWithPatternImage:buttonBgImg];
            
            [topButton setTitle:[NSString stringWithFormat:@"Top-%d",i+1] forState:UIControlStateNormal];
            [topButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];            
            
            topButton.layer.cornerRadius = 2.0f;
            topButton.layer.shadowColor = [[UIColor colorWithRed:0.02 green:0.29 blue:0.17 alpha:0.5] CGColor];
            topButton.layer.shadowOffset = CGSizeMake(5, 5);
            topButton.layer.shadowOpacity = 1.0f;

            
            topButton.transform = CGAffineTransformMakeRotation(TOP_BUTTON_ANGLE*(2*(random%2)-1) * (M_PI / 180.0f));
            [_topLabels addObject:topButton];
            [_scrollView addSubview:topButton];
        }
        
        
        

    }
    return self;
}
-(void)loadView{
    [super loadView];
    [self.view addSubview:_scrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    for (UIView * top in _topLabels) {
        int random = arc4random() % 100;
        top.frame = CGRectMake((2*(random%2)-1)*400*(random%5+1), (2*(random%2)-1)*500*(random%5+1), TOP_BUTTON_WIDTH, TOP_BUTTON_HEIGH);
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    int i=0;
    for (UIView * top in _topLabels) {
        int mod = i % 2;
        int row = i/2;
        CGRect frame = top.frame;
        frame.origin.x = (TOP_BUTTON_WIDTH+10)*mod+TOP_BUTTON_FRAME_BASE_X;
        frame.origin.y = (TOP_BUTTON_HEIGH+15)*row+TOP_BUTTON_FRAME_BASE_Y;
        [UIView animateWithDuration:0.6f animations:^{
            top.frame = frame;
        }completion:^(BOOL finished) {
            
        }]; 
        i++;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
