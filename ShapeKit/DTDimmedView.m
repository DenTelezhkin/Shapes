//
//  RoundDimmedView.m
//
//  Created by Denys Telezhkin on 23.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTDimmedView.h"
#import "CAShapeLayer+UIBezierPath.h"

@interface DTDimmedView()
@property (nonatomic, strong) CAShapeLayer * fillLayer;

@end

@implementation DTDimmedView

@synthesize dimmedPath = _dimmedPath;

#pragma mark - appearance

+(void)load
{
    [self.appearance setDimmingOpacity:0.9];
    [self.appearance setDimmingColor:[UIColor blackColor]];
}

#pragma mark - getters and setters

-(UIBezierPath *)dimmedPath
{
    if (!_dimmedPath)
    {
        _dimmedPath = [UIBezierPath bezierPathWithRect:self.bounds];
    }
    return _dimmedPath;
}

-(void)setDimmedPath:(UIBezierPath *)dimmedPath
{
    _dimmedPath = dimmedPath;
    [self updatePathsWithVisiblePath:self.visiblePath];
}

-(void)setVisiblePath:(UIBezierPath *)visiblePath
{
    _visiblePath = visiblePath;
    [self updatePathsWithVisiblePath:visiblePath];
}

-(void)setDimmingColor:(UIColor *)dimmingColor
{
    _dimmingColor = dimmingColor;
    [self updatePathsWithVisiblePath:self.visiblePath];
}

#pragma mark - updating visible paths

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
    self.fillLayer.opacity = self.dimmingOpacity;
    
    [self.layer addSublayer:self.fillLayer];
}

@end
