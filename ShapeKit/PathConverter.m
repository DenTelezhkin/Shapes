//
//  PathConverter.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 10.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "PathConverter.h"

@implementation PathConverter

+(void)updateShapeLayer:(CAShapeLayer *)shapeLayer
         withBezierPath:(UIBezierPath *)path
{
    shapeLayer.path = [path CGPath];
    shapeLayer.lineWidth = path.lineWidth;
    shapeLayer.miterLimit = path.miterLimit;
    
    switch (path.lineCapStyle) {
        case kCGLineCapRound:
            shapeLayer.lineCap = kCALineCapRound;
            break;
        case kCGLineCapButt:
            shapeLayer.lineCap = kCALineCapButt;
            break;
        case kCGLineCapSquare:
            shapeLayer.lineCap = kCALineCapSquare;
            break;
        default:
            break;
    }
    
    switch (path.lineJoinStyle) {
        case kCGLineJoinRound:
            shapeLayer.lineJoin = kCALineJoinRound;
            break;
        case kCGLineJoinMiter:
            shapeLayer.lineJoin = kCALineJoinMiter;
            break;
        case kCGLineJoinBevel:
            shapeLayer.lineJoin = kCALineJoinBevel;
            break;
        default:
            break;
    }
    
    if (path.usesEvenOddFillRule)
    {
        shapeLayer.fillRule = kCAFillRuleEvenOdd;
    }
    
    NSInteger count;
    [path getLineDash:NULL count:&count phase:NULL];
    CGFloat pattern[count], phase;
    [path getLineDash:pattern count:NULL phase:&phase];
    
    NSMutableArray *lineDashPattern = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        [lineDashPattern addObject:@(pattern[i])];
    }
    
    shapeLayer.lineDashPattern = [lineDashPattern copy];
    shapeLayer.lineDashPhase = phase;
}

@end
