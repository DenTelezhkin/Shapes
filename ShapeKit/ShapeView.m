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

@end
