//
//  QATableViewCellFactory.m
//  UBabyTime
//
//  Created by Zhimin Jiang on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "QATableViewCellFactory.h"
#define INFO_VIEW_WIDTH 120
#define INFO_VIEW_HEIGHT 44
#define INFO_VIEW_FRAME_X 180
#define INFO_VIEW_FRAME_Y 0
#define INFO_IMAGE_FRAME_Y 4

@implementation QATableViewCellFactory

+(void)populateQATableViewCell:(UITableViewCell *) cell{
    UIView *infoView = [[[UIView alloc] initWithFrame:CGRectMake(INFO_VIEW_FRAME_X, INFO_VIEW_FRAME_Y, INFO_VIEW_WIDTH, INFO_VIEW_HEIGHT)] autorelease];
    UIImage *voteImage = [UIImage imageNamed:@"feed-feedback-emotion-heart"];
    UIImageView *voteView = [[[UIImageView alloc] initWithImage:voteImage] autorelease];
    voteView.frame = CGRectMake(0, INFO_IMAGE_FRAME_Y, voteImage.size.width, voteImage.size.height);
    [infoView addSubview:voteView];
    UILabel *voteText = [[[UILabel alloc] initWithFrame:CGRectMake(voteView.frame.origin.x, voteView.frame.size.height+INFO_IMAGE_FRAME_Y, voteView.frame.size.width*2, voteView.frame.size.height)] autorelease];
    voteText.backgroundColor = [UIColor clearColor];
    voteText.textAlignment = UITextAlignmentLeft;
    voteText.text = @"11";
    voteText.font = [UIFont systemFontOfSize:12];
    voteText.textColor = [UIColor lightGrayColor];
    [infoView addSubview:voteText];
    
    UIImage *answerImage = [UIImage imageNamed:@"feed-feedback-emotion-laugh"];
    UIImageView *answerView = [[[UIImageView alloc] initWithImage:answerImage] autorelease];
    answerView.frame = CGRectMake(INFO_VIEW_WIDTH/3, INFO_IMAGE_FRAME_Y, answerImage.size.width, answerImage.size.height);
    [infoView addSubview:answerView];
    UILabel *answerText = [[[UILabel alloc] initWithFrame:CGRectMake(answerView.frame.origin.x, answerView.frame.size.height+INFO_IMAGE_FRAME_Y, answerView.frame.size.width*2, answerView.frame.size.height)] autorelease];
    answerText.backgroundColor = [UIColor clearColor];
    answerText.textAlignment = UITextAlignmentLeft;
    answerText.text = @"12";
    answerText.font = [UIFont systemFontOfSize:12];
    answerText.textColor = [UIColor lightGrayColor];
    [infoView addSubview:answerText];
    
    UIImage *viewImage = [UIImage imageNamed:@"feed-feedback-emotion-sad"];
    UIImageView *viewView = [[[UIImageView alloc] initWithImage:viewImage] autorelease];
    viewView.frame = CGRectMake(INFO_VIEW_WIDTH*2/3, INFO_IMAGE_FRAME_Y, viewImage.size.width, viewImage.size.height);
    [infoView addSubview:viewView];
    UILabel *viewText = [[[UILabel alloc] initWithFrame:CGRectMake(viewView.frame.origin.x, viewView.frame.size.height+INFO_IMAGE_FRAME_Y, viewView.frame.size.width*2, viewView.frame.size.height)] autorelease];
    viewText.backgroundColor = [UIColor clearColor];
    viewText.textAlignment = UITextAlignmentLeft;
    viewText.text = @"133";
    viewText.font = [UIFont systemFontOfSize:12];
    viewText.textColor = [UIColor lightGrayColor];
    [infoView addSubview:viewText];
    
    [cell addSubview:infoView];
    
    UIImageView *accessory = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"activity-chevron-highlighted"]];
    CGRect accessoryFrame = CGRectMake(cell.accessoryView.frame.origin.x, cell.accessoryView.frame.origin.y, 30, cell.accessoryView.frame.size.height);
    cell.accessoryView.frame = accessoryFrame;
    cell.accessoryView = accessory;
    [accessory release];
}
@end
