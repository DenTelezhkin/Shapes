//
//  ProgressView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

static NSString * const kStrokeEndAnimationKey = @"Stroke end animation";

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.shapeLayer.speed = 0;
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    animation.speed = 0.25;
    animation.calculationMode = kCAAnimationPaced;
    animation.values = @[@0,@1];
    
    [self.shapeLayer addAnimation:animation forKey:kStrokeEndAnimationKey];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = self.frame.size.height;
    [path moveToPoint:CGPointMake(0, self.frame.size.height/2)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2)];
    self.path = path;
}

-(void)setProgress:(float)progress
{
    NSParameterAssert(progress>=0);
    
    if (progress>1)
    {
        progress =1;
    }
    self.shapeLayer.timeOffset = progress;
}

-(void)setFillColor:(UIColor *)fillColor
{
    self.shapeLayer.strokeColor = [fillColor CGColor];
    self.shapeLayer.masksToBounds = YES;
    _fillColor = fillColor;
}

@end
