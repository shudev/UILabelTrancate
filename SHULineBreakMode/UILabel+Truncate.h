#import <Foundation/Foundation.h>


@interface UILabel (Truncate)
//- (NSString*)stringByTruncatingStringWithFont:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode;

- (void)setTruncatingText:(NSString *) txt forNumberOfLines:(int) lines;

@end
