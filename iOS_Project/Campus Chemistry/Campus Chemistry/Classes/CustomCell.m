//
//  CustomCell.m
//  Campus Chemistry
//
//  Created by Melissa Kendall on 12-03-18.
//  Copyright (c) 2012 University of Manitoba. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize primaryLabel, secondaryLabel, myImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) 
    {
        primaryLabel = [[UILabel alloc]init];
        primaryLabel.textAlignment = UITextAlignmentLeft;
        primaryLabel.font = [UIFont systemFontOfSize:14];
        
        secondaryLabel = [[UILabel alloc]init];
        secondaryLabel.textAlignment = UITextAlignmentLeft;
        secondaryLabel.font = [UIFont systemFontOfSize:8];        
        
        myImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:primaryLabel];
        [self.contentView addSubview:secondaryLabel];
        [self.contentView addSubview:myImageView];
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) layoutSubviews 
{
    [super layoutSubviews];
    
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    
    frame = CGRectMake(boundsX+10, 0, 50, 50);
    myImageView.frame = frame;
    
    frame = CGRectMake(boundsX+70, 5, 200, 25);
    primaryLabel.frame = frame;
    
    frame = CGRectMake(boundsX+70, 30, 100, 15);
    secondaryLabel.frame = frame;
    
}

@end
