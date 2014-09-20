//
//  NSMutableAttributedString+hilighting.h
//  Psyclopedia
//
//  Created by Reid Belton on 9/5/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

@interface NSMutableAttributedString (hilighting)

/**
 *  Mutates an existing NSMutableAttributedString to add a "hilight" attribute to the string, over a given range.
 *
 *  @param substring    The substring to hilight instances of
 *  @param hilightColor A UIColor object for the hilight color
 *  @param range        A range that determines which part of the string is evaluated for hilighting. If this parameter
 *                      doex not intersect the range of the string to evaluate, this method will simply return.
 */
//-(void)hilightMatchingSubstring:(NSString*)substring color:(UIColor*)hilightColor range:(NSRange)range;

-(void)hilightMatchingSubstring:(NSString*)substring color:(UIColor*)hilightColor range:(NSRange)range;

@end
