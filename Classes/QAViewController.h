//
//  QAViewControllerViewController.h
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QATableViewCellFactory.h"
#import "EGORefreshTableHeaderView.h"

@interface QAViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,EGORefreshTableHeaderDelegate>
{
    
	EGORefreshTableHeaderView *_refreshHeaderView;
	
	//  Reloading var should really be your tableviews datasource
	//  Putting it here for demo purposes 
	BOOL _reloading;
}
@property (nonatomic,retain)UITableView *tableView;


- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
