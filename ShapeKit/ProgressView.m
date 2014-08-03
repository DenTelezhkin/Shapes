//
//  ProgressView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView()
@end

@implementation ProgressView

static NSString * const kStrokeEndAnimationKey = @"Stroke end animation";
static NSString * const kStrokeStartAnimationKey = @"Stroke start animation";

+(void)load
{
    [self.appearance setAnimationDuration:0.3];
}

-(void)commonSetup
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = self.frame.size.height;
    [path moveToPoint:CGPointMake(0, self.frame.size.height/2)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height/2)];
    [self setPath:path];
    
    [self setFillColor:[UIColor clearColor]];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder])
    {
        [self commonSetup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self commonSetup];
    }
    return self;
}

-(float)progress
{
    return _strokeEnd;
}

- (void)setProgress:(float)progress animated:(BOOL)animated {
    if (animated) {
        if (self.progress == progress) {
            return;
        }
        [self animateToProgress:progress];
    } else {
        _strokeEnd = progress;
    }
}

-(float)normalizedProgressValueFromValue:(float)value
{
    if (value>1)
        return 1;
    if (value<0)
        return 0;
    return value;
}

-(void)setStrokeStart:(float)strokeStart animated:(BOOL)animated
{
    strokeStart = [self normalizedProgressValueFromValue:strokeStart];
    
    if (animated)
    {
        [self animateStrokeStart:strokeStart];
    }
    else {
        [self.layer removeAnimationForKey:kStrokeStartAnimationKey];
        self.shapeLayer.strokeStart = strokeStart;
        _strokeStart = strokeStart;
    }
}

-(void)setStrokeEnd:(float)end animated:(BOOL)animated
{
    end = [self normalizedProgressValueFromValue:end];
    
    if (animated)
    {
        [self animateStrokeEnd:end];
    }
    else {
        [self.layer removeAnimationForKey:kStrokeEndAnimationKey];
        self.shapeLayer.strokeEnd = end;
        _strokeEnd = end;
    }
}

-(void)animateStrokeStart:(float)start
{
    float fromValue = _strokeStart;
    
    [self.layer removeAnimationForKey:kStrokeStartAnimationKey];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.duration = self.animationDuration;
    animation.valueFunction = self.animationFunction;
    animation.fromValue = @(fromValue);
    animation.toValue = @(start);
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    [self.shapeLayer addAnimation:animation forKey:kStrokeStartAnimationKey];
    
    _strokeStart = start;
}

-(void)animateStrokeEnd:(float)end
{
    float fromValue = _strokeEnd;
    
    [self.layer removeAnimationForKey:kStrokeEndAnimationKey];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = self.animationDuration;
    animation.valueFunction = self.animationFunction;
    animation.fromValue = @(fromValue);
    animation.toValue = @(end);
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    [self.shapeLayer addAnimation:animation forKey:kStrokeEndAnimationKey];
    
    _strokeEnd = end;
}

- (void)animateToProgress:(float)progress
{
    progress = [self normalizedProgressValueFromValue:progress];
    
    [self animateStrokeEnd:progress];
}

- (void)updateProgress
{
    self.shapeLayer.strokeEnd = _strokeEnd;
    self.shapeLayer.strokeStart = _strokeStart;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)finished
{
    if (finished)
    {
        if ([anim isKindOfClass:[CAPropertyAnimation class]])
        {
            [self updateProgress];
            NSString * keyPath = [(CAPropertyAnimation *)anim keyPath];
            if ([keyPath isEqualToString:@"strokeStart"])
            {
                [self.layer removeAnimationForKey:kStrokeStartAnimationKey];
            }
            else if ([keyPath isEqualToString:@"strokeEnd"])
            {
                [self.layer removeAnimationForKey:kStrokeEndAnimationKey];
            }
        }
    }
}

@end
