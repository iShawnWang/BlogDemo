//
//  TextPathHelper.h
//
//  Created by pi on 15/12/5.
//
//

#import <Foundation/Foundation.h>
@import UIKit;


@interface TextPathHelper : NSObject
+(UIBezierPath*)pathForText:(NSString*)text;
+(CAShapeLayer*)textLayerWithText:(NSString*)text frame:(CGRect)frame;
@end
