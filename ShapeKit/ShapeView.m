//
//  ShapedView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ShapeView.h"
#import "PathConverter.h"
@implementation ShapeView

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
    [PathConverter updateShapeLayer:self.shapeLayer
                     withBezierPath:path];
}

-(void)setFillColor:(UIColor *)fillColor
{
    _fillColor = fillColor;
    [self.shapeLayer setFillColor:[fillColor CGColor]];
}

-(void)setStrokeColor:(UIColor *)strokeColor
{
    _strokeColor = strokeColor;
    [self.shapeLayer setStrokeColor:[strokeColor CGColor]];
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

@end
