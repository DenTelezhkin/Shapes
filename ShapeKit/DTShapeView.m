//
//  ShapedView.m
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTShapeView.h"
#import "CAShapeLayer+UIBezierPath.h"
#import "DTGraphicsConverter.h"

@implementation DTShapeView

@dynamic strokeStart, strokeEnd, lineWidth, miterLimit, lineDashPhase, lineDashPattern;

#pragma mark - UIView methods

+(Class)layerClass
{
    return [CAShapeLayer class];
}

-(CAShapeLayer *)shapeLayer
{
    return (CAShapeLayer*)self.layer;
}

#pragma mark - method forwarding

- (BOOL)shouldForwardSelector:(SEL)aSelector {
    return (![[self.layer superclass] instancesRespondToSelector:aSelector] &&
            [self.layer respondsToSelector:aSelector]);
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return (![self respondsToSelector:aSelector] && [self shouldForwardSelector:aSelector]) ? self.layer : self;
}

#pragma mark - getters and setters 

-(void)setPath:(UIBezierPath *)path
{
    _path = path;
    [self.shapeLayer dt_updateWithBezierPath:path];
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


#pragma mark CALayerDelegate protocol

- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)key {
    id<CAAction> action = [super actionForLayer:layer forKey:key];
    
    if ([layer isEqual:self.layer] && [[NSNull null] isEqual:action]) {
        if ([self shouldForwardSelector:NSSelectorFromString(key)]) {
            CABasicAnimation *animation = (CABasicAnimation *)[self actionForLayer:layer forKey:@"bounds"];
            if ([animation isKindOfClass:[CABasicAnimation class]]) {
                animation.fromValue = [layer valueForKey:key];
                animation.keyPath = key;
                action = animation;
            }
        }
    }
    
    return action;
}

#pragma mark - hit testing

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL inside = [super pointInside:point withEvent:event];
    return self.hitTestInsidePath ? [self.path containsPoint:point] && inside : inside;
}

@end
