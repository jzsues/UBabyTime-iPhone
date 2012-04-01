//
//  CalendarViewControllerViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-4-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PregnacyDaliyTips.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+AUISelectiveBorder.h"

@interface CalendarViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
}
@end
