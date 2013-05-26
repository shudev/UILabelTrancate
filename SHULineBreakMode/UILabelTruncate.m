#import "UILabelTruncate.h"

#define ellipsis @"...Mer ▾ "


@implementation UILabelTruncate


#pragma - override

-(void)setText:(NSString *)text{
    
    [self truncatingText:text];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    textRect.origin.y = bounds.origin.y;
    return textRect;
}
/*
-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}*/


#pragma - private method

- (void)truncatingText:(NSString *) txt{
    NSString *string;
    
    string = txt;
    self.numberOfLines = 0;
    NSMutableString *truncatedString = [txt mutableCopy];
    NSInteger lines = self.numberOfLines;

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
