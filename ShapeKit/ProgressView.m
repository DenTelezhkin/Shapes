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

- (void)setProgress:(float)progress animated:(BOOL)animated {
    if (animated) {
        if (self.progress == progress) {
            return;
        }
        [self animateToProgress:progress];
    } else {
        self.progress = progress;
    }
}

- (void)animateToProgress:(float)progress {
    NSLog(@"animate to progress: %f",progress);
    [self stopAnimation];
    
    // Add shape animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = self.animationDuration;
    animation.fromValue = @(self.progress);
    animation.toValue = @(progress);
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.shapeLayer addAnimation:animation forKey:kStrokeEndAnimationKey];
    
    _progress = progress;
}

- (void)stopAnimation {
    // Stop running animation
    [self.layer removeAnimationForKey:kStrokeEndAnimationKey];
}

-(void)setFillColor:(UIColor *)fillColor
{
    self.shapeLayer.strokeColor = [fillColor CGColor];
    self.shapeLayer.masksToBounds = YES;
    _fillColor = fillColor;
}

- (void)updateProgress {
    [self updatePath];
}

- (void)updatePath {
    self.shapeLayer.strokeEnd = self.progress;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self updateProgress];
    [self stopAnimation];
}

@end
