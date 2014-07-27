//
//  RoundDimmedView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 23.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DimmedView.h"

@implementation DimmedView

-(void)commonSetup
{
    self.opacity = 0.9;
    self.dimmingColor = [UIColor blackColor];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self commonSetup];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self commonSetup];
    }
    return self;
}

-(void)makeVisiblePath:(UIBezierPath *)visiblePath dimmedPath:(UIBezierPath *)dimmedPath
{
    [visiblePath setUsesEvenOddFillRule:YES];
    
    [dimmedPath appendPath:visiblePath];
    [dimmedPath setUsesEvenOddFillRule:YES];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = dimmedPath.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = self.dimmingColor.CGColor;
    fillLayer.opacity = self.opacity;
    [self.layer addSublayer:fillLayer];
}

@end
