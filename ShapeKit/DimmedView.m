//
//  RoundDimmedView.m
//  GeoTourist
//
//  Created by Denys Telezhkin on 23.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DimmedView.h"
#import "PathConverter.h"

@interface DimmedView()
@property (nonatomic, strong) CAShapeLayer * fillLayer;

@end

@implementation DimmedView

-(void)commonSetup
{
    self.opacity = 0.9;
    self.dimmingColor = [UIColor blackColor];
}

-(UIBezierPath *)dimmedPath
{
    if (!_dimmedPath)
    {
        _dimmedPath = [UIBezierPath bezierPathWithRect:self.bounds];
    }
    return _dimmedPath;
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

-(void)setVisiblePath:(UIBezierPath *)visiblePath
{
    _visiblePath = visiblePath;
    [self updatePathsWithVisiblePath:visiblePath];
}

-(void)updatePathsWithVisiblePath:(UIBezierPath *)visiblePath
{
    [self.fillLayer removeFromSuperlayer];
    
    visiblePath.usesEvenOddFillRule = YES;
    
    UIBezierPath * dimmedPath = [UIBezierPath bezierPathWithCGPath:self.dimmedPath.CGPath];
    
    [dimmedPath appendPath:visiblePath];
    dimmedPath.usesEvenOddFillRule = YES;
    
    self.fillLayer = [CAShapeLayer layer];
    self.fillLayer.path = dimmedPath.CGPath;
    self.fillLayer.fillRule = kCAFillRuleEvenOdd;
    self.fillLayer.fillColor = self.dimmingColor.CGColor;
    self.fillLayer.opacity = self.opacity;
    
    [self.layer addSublayer:self.fillLayer];
}

@end
