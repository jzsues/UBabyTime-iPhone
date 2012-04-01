//
//  CalendarViewControllerViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-4-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CalendarViewController.h"

#define TITLE_ORIGIN_X 10

#define TITLE_ORIGIN_Y 10

#define TITLE_VIEW_HEIGHT 40

#define TITLE_LABEL_WIDTH 130

#define TOOLBAR_VIEW_HEIGHT 40




@interface CalendarViewController ()
{
    UIView *_titleView;
    UIView *_contentView;
    UIView *_toolbarView;
}
-(void)buildTitleView;
-(void)buildContentView;
-(void)buildToolbarView;
@end

@implementation CalendarViewController

- (id)init
{
    self = [super initWithNibName:@"CalendarViewController" bundle:nil];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT)];
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buildTitleView];
    [self buildContentView];
    [self buildToolbarView];
    [self.view  addSubview:_scrollView];
	
}

-(void)buildTitleView{
    CGRect  titleViewFrame = CGRectMake(TITLE_ORIGIN_X, TITLE_ORIGIN_Y, _scrollView.frame.size.width, TITLE_VIEW_HEIGHT);
    _titleView = [[UIView alloc] initWithFrame:titleViewFrame];
    
    UIImage *titleImage = [UIImage imageNamed:@"events"];
    UIImageView *titleImageView = [[[UIImageView alloc] initWithImage:titleImage] autorelease];
    CGRect imageFrame = CGRectMake(0, 0, titleImage.size.width,titleImage.size.height);
    titleImageView.frame = imageFrame;
    UILabel *titleLabel = [[[UILabel alloc] init] autorelease];
    CGRect labelFrame = CGRectMake(imageFrame.size.width, 0, TITLE_LABEL_WIDTH, imageFrame.size.height);
    titleLabel.frame = labelFrame;
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel setText:@"怀孕第1天(第1周)"];
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    titleLabel.textAlignment = UITextAlignmentLeft;
    
    UIView *titleLine = [[[UIView alloc] init] autorelease];
    CGRect lineFrame = CGRectMake(labelFrame.origin.x+labelFrame.size.width,imageFrame.size.height/2, _scrollView.frame.size.width-titleImageView.frame.size.width-titleLabel.frame.size.width-10, 2);
    titleLine.frame = lineFrame;
    titleLine.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"article_title_line"]];
    [_titleView addSubview:titleImageView];
    [_titleView addSubview:titleLabel];
    [_titleView addSubview:titleLine];
    
    [_scrollView addSubview:_titleView];
}

-(void)buildContentView{
    CGRect  contentViewFrame = CGRectMake(TITLE_ORIGIN_X, TITLE_ORIGIN_Y+TITLE_VIEW_HEIGHT, _scrollView.frame.size.width, _scrollView.frame.size.height-TITLE_VIEW_HEIGHT-TOOLBAR_VIEW_HEIGHT);
    _contentView = [[UIView alloc] initWithFrame:contentViewFrame];
    
    
    CGRect frame = CGRectMake(0, 0, _contentView.frame.size.width, _contentView.frame.size.height/3);
    UIView *view1 = [[[UIView alloc] initWithFrame:frame] autorelease];
    view1.selectiveBorderFlag = AUISelectiveBordersFlagBottom;
    view1.selectiveBordersColor = [UIColor lightGrayColor];
    view1.selectiveBordersWidth = 1.0f;
    [_contentView addSubview:view1];
    
    
    
    [_scrollView addSubview:view1];
    
    
}
-(void)buildToolbarView{
    CGRect  toolbarViewFrame = CGRectMake(TITLE_ORIGIN_X, TITLE_ORIGIN_Y+TITLE_VIEW_HEIGHT+_contentView.frame.size.height, _scrollView.frame.size.width, TOOLBAR_VIEW_HEIGHT);
    _toolbarView = [[UIView alloc] initWithFrame:toolbarViewFrame];
    _toolbarView.selectiveBorderFlag = AUISelectiveBordersFlagTop;
    _toolbarView.selectiveBordersColor = [UIColor lightGrayColor];
    _toolbarView.selectiveBordersWidth = 1.0f;
    [_scrollView addSubview:_toolbarView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

@end
