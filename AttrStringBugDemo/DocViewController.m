//
//  DocViewController.m
//  AttrStringBugDemo
//
//  Created by reidbelton on 9/20/14.
//  Copyright (c) 2014 Reid Belton. All rights reserved.
//

#import "DocViewController.h"
#import "NSMutableAttributedString+hilighting.h"

@interface DocViewController () <UISearchBarDelegate>

@end

@implementation DocViewController
{
    NSArray *_words;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel*)view;
            
            NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:label.text];
            [attrString hilightMatchingSubstring:searchText color:[UIColor blueColor] range:NSMakeRange(0, attrString.length)];
            label.attributedText = attrString;
        }
    }
}


- (IBAction)switchBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
