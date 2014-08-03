//
//  ShapedView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

+(Class)layerClass
{
    return [CAShapeLayer class];
}

-(CAShapeLayer *)shapeLayer
{
    return (CAShapeLayer*)self.layer;
}

-(void)setPath:(UIBezierPath *)path
{
    _path = path;
    self.shapeLayer.path = [_path CGPath];
    self.shapeLayer.lineWidth = path.lineWidth;
    self.shapeLayer.miterLimit = path.miterLimit;
    
    switch (path.lineCapStyle) {
        case kCGLineCapRound:
            self.shapeLayer.lineCap = kCALineCapRound;
            break;
        case kCGLineCapButt:
            self.shapeLayer.lineCap = kCALineCapButt;
            break;
        case kCGLineCapSquare:
            self.shapeLayer.lineCap = kCALineCapSquare;
            break;
        default:
            break;
    }
    
    switch (path.lineJoinStyle) {
        case kCGLineJoinRound:
            self.shapeLayer.lineJoin = kCALineJoinRound;
            break;
        case kCGLineJoinMiter:
            self.shapeLayer.lineJoin = kCALineJoinMiter;
            break;
        case kCGLineJoinBevel:
            self.shapeLayer.lineJoin = kCALineJoinBevel;
            break;
        default:
            break;
    }
    
    if (path.usesEvenOddFillRule)
    {
        self.shapeLayer.fillRule = kCAFillRuleEvenOdd;
    }
    
    NSInteger count;
    [path getLineDash:NULL count:&count phase:NULL];
    CGFloat pattern[count], phase;
    [path getLineDash:pattern count:NULL phase:&phase];
    
    NSMutableArray *lineDashPattern = [NSMutableArray array];
    for (NSUInteger i = 0; i < count; i++) {
        [lineDashPattern addObject:@(pattern[i])];
    }
    
    self.shapeLayer.lineDashPattern = [lineDashPattern copy];
    self.shapeLayer.lineDashPhase = phase;
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

@end
