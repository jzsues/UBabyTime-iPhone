//
//  CoverViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CoverViewController.h"

@implementation CoverViewController
@synthesize coverViewDelegate = _coverViewDelegate;
@synthesize coverPagingScrollView = _coverPagingScrollView;
- (void)dealloc
{
    [_coverPagingScrollView release];
    [super dealloc];
}
-(id)init{
    if([self initWithNibName:@"CoverViewController" bundle:nil]){
        CGRect frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT);
        _coverPagingScrollView = [[CoverPagingScrollView alloc] initWithFrame:frame];
        CoverPagingScrollDataSource *dataSource =[[CoverPagingScrollDataSource alloc] init];
        dataSource.coverViewDelegate = self;
        _coverPagingScrollView.dataSource = dataSource;
        _coverPagingScrollView.delegate = self;
        [_coverPagingScrollView reloadData];
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - CoverViewDelegate

-(void)proposalDetailButtonClick:(id)sender;{
    //self.navigationController pushViewController:<#(UIViewController *)#> animated:<#(BOOL)#>
    ArticleViewController *avc = [[[ArticleViewController alloc] init] autorelease];
    [self.navigationController pushViewController:avc animated:YES];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    _coverPagingScrollView.layer.cornerRadius = 5;
    _coverPagingScrollView.layer.masksToBounds = YES;
    _coverPagingScrollView.layer.shadowColor = [[UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:0.2] CGColor];
    _coverPagingScrollView.layer.shadowRadius = 3;
    _coverPagingScrollView.layer.borderWidth = 1;
    _coverPagingScrollView.layer.borderColor = [[UIColor colorWithRed:0.42 green:0.09 blue:0.07 alpha:0.12] CGColor];
    [self.view addSubview:_coverPagingScrollView];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.coverPagingScrollView = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - NIPagingScrollViewDelegate

/**
 * The user is scrolling between two photos.
 */
- (void)pagingScrollViewDidScroll:(NIPagingScrollView *)pagingScrollView{
    //NSLog(@"pagingScrollViewDidScroll");
}

/**
 * The current page has changed.
 *
 * pagingScrollView.centerPageIndex will reflect the changed page index.
 */
- (void)pagingScrollViewDidChangePages:(NIPagingScrollView *)pagingScrollView{
    [pagingScrollView centerPageIndex];
}

@end
