//
//  CAShapeLayer+UIBezierPath.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 19.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "CAShapeLayer+UIBezierPath.h"

@implementation CAShapeLayer (UIBezierPath)

+(NSDictionary *)dt_lineCaps
{
    return @{
             kCALineCapSquare : @(kCGLineCapSquare),
             kCALineCapButt : @(kCGLineCapButt),
             kCALineCapRound : @(kCGLineCapRound)
             };
}

+(NSDictionary *)dt_lineJoins
{
    return @{
             kCALineJoinRound : @(kCGLineJoinRound),
             kCALineJoinMiter : @(kCGLineJoinMiter),
             kCALineJoinBevel : @(kCGLineJoinBevel)
             };
}

-(void)dt_updateWithBezierPath:(UIBezierPath *)path
{
    self.path = [path CGPath];
    self.lineWidth = path.lineWidth;
    self.miterLimit = path.miterLimit;
    
    self.lineCap = [[[[self class] dt_lineCaps] allKeysForObject:@(path.lineCapStyle)] firstObject];
    self.lineJoin = [[[[self class] dt_lineJoins] allKeysForObject:@(path.lineJoinStyle)] firstObject];
    
    self.fillRule = path.usesEvenOddFillRule ? kCAFillRuleEvenOdd : kCAFillRuleNonZero;
    
    NSInteger count;
    [path getLineDash:NULL count:&count phase:NULL];
    CGFloat pattern[count], phase;
    [path getLineDash:pattern count:NULL phase:&phase];
    
    NSMutableArray *lineDashPattern = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        [lineDashPattern addObject:@(pattern[i])];
    }
    
    self.lineDashPattern = [lineDashPattern copy];
    self.lineDashPhase = phase;
}

-(UIBezierPath *)dt_bezierPath
{
    UIBezierPath * path = [UIBezierPath bezierPathWithCGPath:self.path];
    path.lineWidth = self.lineWidth;
    path.miterLimit = self.miterLimit;

    path.lineCapStyle = [[[[self class] dt_lineCaps] objectForKey:self.lineCap] intValue];
    path.lineJoinStyle = [[[[self class] dt_lineCaps] objectForKey:self.lineJoin] intValue];
    
    CGFloat phase = self.lineDashPhase;
    NSInteger count = self.lineDashPattern.count;
    CGFloat pattern[count];
    for (NSUInteger i = 0; i < count; i++) {
        pattern[i] = [[self.lineDashPattern objectAtIndex:i] floatValue];
    }
    [path setLineDash:pattern count:count phase:phase];
    
    return path;
}

@end
