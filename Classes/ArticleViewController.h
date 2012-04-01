//
//  ArticleViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleView.h"

@protocol ArticleViewControllerDelegate 

-(void)backButtonClick:(id)sender;
    
@end

@interface ArticleViewController : UIViewController
{
    
}

@property (nonatomic,retain) IBOutlet UIButton *backButton;
@property (nonatomic,retain) IBOutlet UIButton *favourButton;
@property (nonatomic,retain) IBOutlet UIButton *commentButton;
@property (nonatomic,retain) IBOutlet UIButton *otherButton;
@property (nonatomic,retain) ArticleView *articleView;

-(IBAction)backButtonClick:(id)sender;

@end
