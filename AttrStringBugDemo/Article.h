//
//  Article.h
//  AttrStringBugDemo
//
//  Created by reidbelton on 9/20/14.
//  Copyright (c) 2014 Reid Belton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic, strong) NSMutableAttributedString *title;
@property (nonatomic, strong) NSMutableAttributedString *keywords;

@end
