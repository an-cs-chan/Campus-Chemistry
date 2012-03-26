//
//  CustomCell.h
//  Campus Chemistry
//
//  Created by Melissa Kendall on 12-03-18.
//  Copyright (c) 2012 University of Manitoba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    UILabel *primaryLabel;
    UILabel *secondaryLabel;
    UIImageView *myImageView;
}

@property (nonatomic,retain) UILabel *primaryLabel;
@property (nonatomic,retain) UILabel *secondaryLabel;
@property (nonatomic,retain) UIImageView *myImageView;


@end

