//
//  ProgressView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

-(void)setFrame:(CGRect)frame
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = frame.size.height;
    [path moveToPoint:CGPointMake(0, frame.size.height/2)];
    [path addLineToPoint:CGPointMake(frame.size.width, frame.size.height/2)];
    self.path = path;
    [super setFrame:frame];
}

static NSString * const kStrokeEndAnimationKey = @"Stroke end animation";

-(void)setProgress:(float)progress
{
    NSParameterAssert(progress>=0);
    
    if (progress>1)
    {
        progress =1;
    }
    
    [self.shapeLayer removeAnimationForKey:kStrokeEndAnimationKey];
    
    [CATransaction begin];
    
    CABasicAnimation * drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.fromValue = @(self.shapeLayer.strokeEnd);
    drawAnimation.toValue = @(progress);
    drawAnimation.duration = 0.05;
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    drawAnimation.removedOnCompletion = YES;
    
    self.shapeLayer.strokeEnd = progress;
    _progress = progress;
    
    [self.shapeLayer addAnimation:drawAnimation forKey:kStrokeEndAnimationKey];
    [CATransaction commit];
}

-(void)setFillColor:(UIColor *)fillColor
{
    self.shapeLayer.strokeColor = [fillColor CGColor];
    self.shapeLayer.masksToBounds = YES;
    _fillColor = fillColor;
}

@end
