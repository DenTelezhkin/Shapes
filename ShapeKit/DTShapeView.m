//
//  ShapedView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTShapeView.h"
#import "CAShapeLayer+UIBezierPath.h"

@implementation DTShapeView

@dynamic strokeStart, strokeEnd, lineWidth, miterLimit, lineCap, lineJoin, lineDashPhase, lineDashPattern;

@synthesize fillColor = _fillColor, strokeColor = _strokeColor;

+(Class)layerClass
{
    return [CAShapeLayer class];
}

-(CAShapeLayer *)shapeLayer
{
    return (CAShapeLayer*)self.layer;
}

- (BOOL)shouldForwardSelector:(SEL)aSelector {
    return (![[self.layer superclass] instancesRespondToSelector:aSelector] &&
            [self.layer respondsToSelector:aSelector]);
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return (![self respondsToSelector:aSelector] && [self shouldForwardSelector:aSelector]) ? self.layer : self;
}

-(void)setPath:(UIBezierPath *)path
{
    _path = path;
    [self.shapeLayer dt_updateWithBezierPath:path];
}

-(void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
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
    _strokeColor = strokeColor;
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
