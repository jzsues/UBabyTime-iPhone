//
//  SearchTopTenViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTopTenViewController : UIViewController
{
    NSMutableArray *_topLabels;
}

@property (nonatomic,retain)UIScrollView *scrollView;
@end
