//
//  CMTableViewController.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CMTableViewController.h"

@interface CMTableViewController ()

@end

@implementation CMTableViewController
@synthesize tableView = _tableView;
- (id)init
{
    self = [super init];
    if (self) {
        _tableView = [[[UITableView alloc] initWithFrame:CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT) style:UITableViewStylePlain] autorelease];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"feed-paper-texture.png"]];
    }
    return self;
}
-(void)loadView{
    [super loadView];
    UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(CONTENT_VIEW_ORIGIN_X, CONTENT_VIEW_ORIGIN_Y, CONTENT_VIEW_WIDTH, CONTENT_VIEW_HEIGHT)] autorelease];
    [view addSubview:self.tableView];    
    self.view = view;
    _scroller = [[[TableScroller alloc] initWithDelegate:self] autorelease];
    [self.view addSubview:_scroller];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    self.tableView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)  
    {  
        // Create a cell to display an ingredient.  
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        [TimeLineProvider populateCell:cell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }  
    // Configure the cell.  
    //NSLog(@"indexPath:%@",indexPath);
    cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
    cell.textLabel.text=[TimeLineProvider convertIndexPathToDate:indexPath];  
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    cell.detailTextLabel.text = [TimeLineProvider convertIndexPathToWeek:indexPath];
    
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //[NSString stringWithFormat:@"title-%d",section+1]
    return nil;
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:50];
    for(int i=0;i<50;i++){
        [array addObject:[NSString stringWithFormat:@"%d",i+1 ]]; 
    }
    return array;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [title integerValue];
}

#pragma TableScrollerDelegate

- (NSString *)tipsForCell:(UITableViewCell *)cell{
    NSIndexPath *path = [_tableView indexPathForCell:cell];
    return [NSString stringWithFormat:@"第%d周",path.section+1];
}

#pragma mark UIScrollViewDelegateMethods

//The TimeScroller needs to know what's happening with the UITableView (UIScrollView)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat viewHeight = self.view.frame.size.height;
    //NSLog(@"Timeline View scrollViewDidScroll，scrollView：%@,tableView:%@",scrollView,_tableView);
    CGPoint offsetPoint = scrollView.contentOffset;
    CGSize contentSize = [_tableView contentSize];
    //NSLog(@"_tableView content size height:%f",contentSize.height);
    CGFloat offsetPointY = offsetPoint.y;
    CGFloat contentSizeHeight = contentSize.height;
    CGFloat scale = offsetPointY/contentSizeHeight;
    CGFloat newHeight = (viewHeight-24)*scale;
    //NSLog(@"scale:%f,cau size:%f",scale,newHeight);
    CGRect frame=  _scroller.frame;
    frame.origin.y = newHeight;
    _scroller.frame = frame;
    
    NSArray *visibleRows = [_tableView indexPathsForVisibleRows];
    if([visibleRows count]>0){
        NSIndexPath *currentIndex = [visibleRows objectAtIndex:1];
        //NSLog(@"visibleRows count:%@", currentIndex);
        [_scroller scrollViewDidScroll:[_tableView cellForRowAtIndexPath:currentIndex]];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [_scroller scrollViewDidEndDecelerating];
    
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_scroller scrollViewWillBeginDragging];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (!decelerate) {
        
               
    }
    
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}




@end
