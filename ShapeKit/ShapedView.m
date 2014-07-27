//
//  ShapedView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ShapedView.h"

@implementation ShapedView

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
}

@end
