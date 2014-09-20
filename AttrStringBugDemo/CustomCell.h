//
//  CustomCell.h
//  AttrStringBugDemo
//
//  Created by reidbelton on 9/20/14.
//  Copyright (c) 2014 Reid Belton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *myTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *myKeywordLabel;

@end
