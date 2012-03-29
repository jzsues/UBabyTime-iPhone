//
//  StaticContentViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LabelConverter.h"
#import "CoverViewController.h"
#import "CMTableViewController.h"
#import "QAViewController.h"
#import "SearchViewController.h"
#import "SearchTopTenViewController.h"
#import "QADetailViewController.h"
@protocol StaticContentViewControllerDelegate;

@interface StaticContentViewController : UIViewController
{
    
}

@property (nonatomic, assign) id<StaticContentViewControllerDelegate> delegate;
@property (nonatomic, retain) UIViewController *currentController;
@property (nonatomic,copy)  NSString *labelIdentifier;

-(void)loadContentByLabelIdentifier:(NSString*)labelIdentifier;
-(void)loadContentByLabelIdentifier:(NSString*)labelIdentifier withAnimationOptions:(UIViewAnimationOptions)options;

@end

@protocol StaticContentViewControllerDelegate

@end