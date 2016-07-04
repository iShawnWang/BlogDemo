//
//  TextPathHelper.m
//
//  Created by pi on 15/12/5.
//
//

#import "TextPathHelper.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreText/CoreText.h>
#import <UIKit/UIBezierPath.h>
#import <UIKit/UIColor.h>

@implementation TextPathHelper
+(UIBezierPath*)pathForText:(NSString*)text{
    
    CGMutablePathRef letters = CGPathCreateMutable();
    
    CTFontRef font = CTFontCreateWithName(CFSTR("Helvetica-Bold"), 100.0f, NULL);
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge id)font, kCTFontAttributeName,
                           nil];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:text
                                                                     attributes:attrs];
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    // for each RUN
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        // Get FONT for this run
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        // for each GLYPH in run
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            // get Glyph & Glyph-data
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            // Get PATH of outline
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];

    CGPathRelease(letters);
    CFRelease(font);
    return path;
}

+(CAShapeLayer*)textLayerWithText:(NSString*)text frame:(CGRect)frame{
    UIBezierPath *path= [TextPathHelper pathForText:text];
    //text path layer
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = frame;
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
//    pathLayer.backgroundColor = [[UIColor yellowColor] CGColor];
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor blackColor] CGColor];
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.lineWidth = 7.0f;
    pathLayer.lineJoin = kCALineJoinRound;
    return pathLayer;
}
@end
