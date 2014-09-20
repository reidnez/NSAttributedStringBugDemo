//
//  NSMutableAttributedString+hilighting.m
//  Psyclopedia
//
//  Created by Reid Belton on 9/5/14.
//
//

#import "NSMutableAttributedString+hilighting.h"
#import <UIKit/UIKit.h>

@implementation NSMutableAttributedString (hilighting)

-(void)hilightMatchingSubstring:(NSString*)substring color:(UIColor*)hilightColor range:(NSRange)range
{
    if ([self.string compare:substring options:NSCaseInsensitiveSearch] == NSOrderedSame) {
        [self addAttribute:NSBackgroundColorAttributeName value:hilightColor range:NSMakeRange(0, self.length)];
        return;
    }
    
    // Sanity check. Make sure a valid range has been passed so that we don't get out-of-bounds crashes. Default to return self wrapped in an attributed string with no attributes.
    NSRange selfRange = NSMakeRange(0, self.length);
    if (NSIntersectionRange(selfRange, range).length == 0) {
        NSLog(@" \n\n\n*** Match range {%lu, %lu} does not intersect main string's range {%lu, %lu}. Aborting *** \n\n\n", (unsigned long)range.location, (unsigned long)range.length, (unsigned long)selfRange.location, (unsigned long)selfRange.length);
        return;
    }
    
    if (substring.length > 0) {
        NSRange movingRange = NSMakeRange(range.location, substring.length);
        if (NSMaxRange(movingRange) > self.length) {
            return;
        }
        
        NSString *movingString = [self.string substringWithRange:movingRange];
        
        while (NSMaxRange(movingRange) < NSMaxRange(range)) {
            if ([movingString compare:substring options:NSCaseInsensitiveSearch] == NSOrderedSame) {
                [self addAttribute:NSBackgroundColorAttributeName value:hilightColor range:movingRange];
            }
            movingRange = NSMakeRange(movingRange.location + 1, substring.length);
            movingString = [self.string substringWithRange:movingRange];
        }
    } // This is fine...string leaves properly attributed.
}


@end
