#import "UILabel+Truncate.h"

#define ellipsis @"...Mer ▾ "
#define kNumberOfLines 2

@implementation UILabel ( Truncate )
/*
// The original code is at http://stackoverflow.com/questions/2266396/how-to-truncate-an-nsstring-based-on-the-graphical-width
- (NSString*)stringByTruncatingStringWithFont:(UIFont *)font forWidth:(CGFloat)width forHeight:(CGFloat)height
{
    NSMutableString *resultString = [self mutableCopy];
    NSRange range = {resultString.length-1, 1};
    
    // 必要な行数を計算する
    float oneLineHeight = [self sizeWithFont:font].height;
    float totalHeight = [self sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping].height;
    int numberOfLinesNeeded =  nearbyint(totalHeight/oneLineHeight);

    while ([resultString sizeWithFont:font forWidth:FLT_MAX lineBreakMode:lineBreakMode].width > width) {
        // delete the last character
        [resultString deleteCharactersInRange:range];
        range.location--;
        // replace the last but one character with an ellipsis
        [resultString replaceCharactersInRange:range withString:@"…"];
    }
    NSLog(@"resultString = %@", resultString );
    
    return resultString;
}*/

- (void)setTruncatingText:(NSString *) txt forNumberOfLines:(int) lines{
    NSString *string;
    
    string = txt;
    self.numberOfLines = 0;
    NSMutableString *truncatedString = [txt mutableCopy];
    if ([self numberOfLinesNeeded:truncatedString] > lines) {
        [truncatedString appendString:ellipsis];
        NSRange range = NSMakeRange(truncatedString.length - (ellipsis.length + 1), 1);
        while ([self numberOfLinesNeeded:truncatedString] > lines) {
            [truncatedString deleteCharactersInRange:range];
            range.location--;
        }
        [truncatedString deleteCharactersInRange:range];  //need to delete one more to make it fit
        CGRect labelFrame = self.frame;
        labelFrame.size.height = [txt sizeWithFont:self.font].height * lines;
        self.frame = labelFrame;
        self.text = truncatedString;
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(expand:)];
        [self addGestureRecognizer:tapper];
    }else{
        CGRect labelFrame = self.frame;
        labelFrame.size.height = [txt sizeWithFont:self.font].height * lines;
        self.frame = labelFrame;
        self.text = txt;
    }
}

-(int)numberOfLinesNeeded:(NSString *) s {
    float oneLineHeight = [s sizeWithFont:self.font].height;
    float totalHeight = [s sizeWithFont:self.font constrainedToSize:CGSizeMake(self.bounds.size.width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping].height;
    return nearbyint(totalHeight/oneLineHeight);
}

@end
