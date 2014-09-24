//
//  DTShapeView.m
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

#import "DTShapeView.h"
#import "CAShapeLayer+UIBezierPath.h"
#import "DTGraphicsConverter.h"
#import "DTAnimatableShapeLayer.h"

@implementation DTShapeView

@dynamic strokeStart, strokeEnd, lineWidth, miterLimit, lineDashPhase, lineDashPattern;

#pragma mark - UIView methods

+(Class)layerClass
{
    return [DTAnimatableShapeLayer class];
}

-(CAShapeLayer *)shapeLayer
{
    return (CAShapeLayer*)self.layer;
}

#pragma mark - method forwarding

- (BOOL)shouldForwardSelector:(SEL)aSelector {
    return (![[[self.layer superclass] superclass] instancesRespondToSelector:aSelector] &&
            [self.layer respondsToSelector:aSelector]);
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return (![self respondsToSelector:aSelector] && [self shouldForwardSelector:aSelector]) ? self.layer : self;
}

#pragma mark - getters and setters 

-(void)setPath:(UIBezierPath *)path
{
    _path = path;
    [CATransaction begin];
    [CATransaction setAnimationDuration:[CATransaction animationDuration]];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] ];
    [self.shapeLayer dt_updateWithBezierPath:path];
    [CATransaction commit];
}

-(void)setFillColor:(UIColor *)fillColor
{
    [self.shapeLayer setFillColor:[fillColor CGColor]];
}

-(UIColor *)fillColor
{
    return [UIColor colorWithCGColor:[self.shapeLayer fillColor]];
}

-(UIColor *)strokeColor
{
   return [UIColor colorWithCGColor:[self.shapeLayer strokeColor]];
}

-(void)setStrokeColor:(UIColor *)strokeColor
{
    [self.shapeLayer setStrokeColor:[strokeColor CGColor]];
}

-(void)setUsesEvenOddFillRule:(BOOL)usesEvenOddFillRule
{
    self.shapeLayer.fillRule = usesEvenOddFillRule ? kCAFillRuleEvenOdd : kCAFillRuleNonZero;
}

-(BOOL)usesEvenOddFillRule
{
    return self.shapeLayer.fillRule == kCAFillRuleEvenOdd;
}

-(void)setLineCap:(CGLineCap)lineCap
{
    self.shapeLayer.lineCap = [DTGraphicsConverter lineCapFromCGLineCap:lineCap];
}

-(CGLineCap)lineCap
{
    return [DTGraphicsConverter lineCapFromCALineCap:self.shapeLayer.lineCap];
}

-(void)setLineJoin:(CGLineJoin)lineJoin
{
    self.shapeLayer.lineJoin = [DTGraphicsConverter lineJoinFromCGLineJoin:lineJoin];
}

-(CGLineJoin)lineJoin
{
    return [DTGraphicsConverter lineJoinFromCALineJoin:self.shapeLayer.lineJoin];
}

#pragma mark - hit testing

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL inside = [super pointInside:point withEvent:event];
    return self.hitTestInsidePath ? [self.path containsPoint:point] && inside : inside;
}

@end
