//
//  DTProgressView.m
//  Shapes
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "DTProgressView.h"

@interface DTProgressView()
@end

@implementation DTProgressView

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
    self.strokeColor = [UIColor grayColor];
    
    self.shapeLayer.strokeEnd = 0;
    self.shapeLayer.strokeStart = 0;
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
    return self.strokeEnd;
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    [self setStrokeEnd:progress animated:animated];
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
        self.strokeStart = strokeStart;
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
        self.strokeEnd = end;
    }
}

-(void)animateStrokeStart:(float)start
{
    float fromValue = self.strokeStart;
    
    if ( [self.shapeLayer animationForKey:kStrokeStartAnimationKey]!=nil)
    {
        CAShapeLayer * presentationLayer = [self.shapeLayer presentationLayer];
        fromValue = [presentationLayer strokeStart];
    }
    
    [self.layer removeAnimationForKey:kStrokeStartAnimationKey];
    
    self.shapeLayer.strokeStart = start;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.duration = self.animationDuration;
    animation.valueFunction = self.animationFunction;
    animation.fromValue = @(fromValue);
    animation.toValue = @(start);
    animation.removedOnCompletion = YES;
    
    [self.shapeLayer addAnimation:animation forKey:kStrokeStartAnimationKey];
    self.strokeStart = start;
}

-(void)animateStrokeEnd:(float)end
{
    float fromValue = self.strokeEnd;
    
    if ( [self.shapeLayer animationForKey:kStrokeEndAnimationKey]!=nil)
    {
        CAShapeLayer * presentationLayer = [self.shapeLayer presentationLayer];
        fromValue = [presentationLayer strokeEnd];
    }
    
    [self.layer removeAnimationForKey:kStrokeEndAnimationKey];
    
    self.shapeLayer.strokeEnd = end;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = self.animationDuration;
    animation.valueFunction = self.animationFunction;
    animation.fromValue = @(fromValue);
    animation.toValue = @(end);
    animation.removedOnCompletion = YES;
    
    [self.shapeLayer addAnimation:animation forKey:kStrokeEndAnimationKey];
    self.strokeEnd = end;
}

- (void)animateToProgress:(float)progress
{
    progress = [self normalizedProgressValueFromValue:progress];
    
    [self animateStrokeEnd:progress];
}

@end
