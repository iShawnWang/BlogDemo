#import "UIView+PiAdditions.h"

@implementation UIView (PiAdditions)

-(float)x{
    return self.frame.origin.x;
}

-(void)setX:(float) newX{
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

-(float)y{
    return self.frame.origin.y;
}

-(void)setY:(float)newY{
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

-(float)width{
    return CGRectGetWidth(self.frame);
}

-(void)setWidth:(float)newWidth{
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

-(float)height{
    return CGRectGetHeight(self.frame);
}

-(void)setHeight:(float)newHeight{
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

-(float)boundWidth{
    return CGRectGetWidth(self.bounds);
}

-(void)setBoundWidth:(float) newWidth{
    CGRect bounds=self.bounds;
    bounds.size.width=newWidth;
    self.bounds=bounds;
}

-(float)boundHeight{
    return CGRectGetHeight(self.bounds);
}

-(void)setBoundHeight:(float)newHeight{
    CGRect bounds=self.bounds;
    bounds.size.height=newHeight;
    self.bounds=bounds;
}
-(float)centerX{
    return self.center.x;
}

-(void)setCenterX:(float)centerX{
    self.center=CGPointMake(centerX, self.center.y);
}

-(float)centerY{
    return self.center.y;
}

-(void)setCenterY:(float)centerY{
    self.center=CGPointMake(self.center.x, centerY);
}
@end
