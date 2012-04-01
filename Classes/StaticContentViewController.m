//
//  StaticContentViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "StaticContentViewController.h"

@interface StaticContentViewController() 
{
    UINavigationController *_todayTipsNavigationController;
    UINavigationController *_timeLineNavigationController;
    UINavigationController *_QANavigationController;
    UINavigationController *_searchNavigationController;
}

-(id)findContentViewByLabelIdentifier:(NSString*)labelIdentifier;

@end

@implementation StaticContentViewController
@synthesize delegate=_delegate;
@synthesize labelIdentifier = _labelIdentifier;
@synthesize currentController = _currentController;


-(void)loadContentByLabelIdentifier:(NSString*)labelIdentifier withAnimationOptions:(UIViewAnimationOptions)options{
    UIViewController *vc = [self findContentViewByLabelIdentifier:labelIdentifier];
    if(vc){
        [UIView transitionWithView:self.view duration:0.5 options:options animations:^{
            [self.currentController.view removeFromSuperview];
            [self.view addSubview:vc.view];
        } completion:NULL];
        self.currentController = vc;
    }
}

-(void)loadContentByLabelIdentifier:(NSString*)labelIdentifier{
    [self loadContentByLabelIdentifier:labelIdentifier withAnimationOptions:UIViewAnimationOptionTransitionFlipFromLeft];
}

-(id)findContentViewByLabelIdentifier:(NSString*)labelIdentifier{
    if([labelIdentifier isEqualToString:kTodayTips]){
        if(!_todayTipsNavigationController){
            CalendarViewController *cvc = [[[CalendarViewController alloc] init] autorelease];
            _todayTipsNavigationController = [[UINavigationController alloc] initWithRootViewController:cvc];
            _todayTipsNavigationController.navigationBarHidden = YES;
            _todayTipsNavigationController.view.frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT);
        }
        return _todayTipsNavigationController;
    }if ([labelIdentifier isEqualToString:kCheckList]) {
        if(!_timeLineNavigationController){
            CMTableViewController *tvc = [[[CMTableViewController alloc] init] autorelease];
            _timeLineNavigationController = [[UINavigationController alloc] initWithRootViewController:tvc];
            _timeLineNavigationController.navigationBarHidden = YES;
            _timeLineNavigationController.view.frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT);
        }
        
        return _timeLineNavigationController;
    }if ([labelIdentifier isEqualToString:kQuestionAndAnswer]) {
        if(!_QANavigationController){
            QAViewController *qvc = [[[QAViewController alloc] init] autorelease];
            _QANavigationController = [[UINavigationController alloc] initWithRootViewController:qvc];
            _QANavigationController.navigationBarHidden = YES;
            _QANavigationController.view.frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT);
        }
        return _QANavigationController;
    }if ([labelIdentifier isEqualToString:kSearchInfo]) {
        if (!_searchNavigationController) {
            SearchTopTenViewController *svc = [[[SearchTopTenViewController alloc] init] autorelease];
            _searchNavigationController = [[UINavigationController alloc] initWithRootViewController:svc];
            _searchNavigationController.navigationBarHidden = YES;
            _searchNavigationController.view.frame = CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT);
        }
        return _searchNavigationController;
    }
    return nil;
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [_todayTipsNavigationController release];
    [_timeLineNavigationController release];
    [_QANavigationController release];
    [_searchNavigationController release];
    [super dealloc];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.currentController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
