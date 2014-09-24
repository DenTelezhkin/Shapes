//
//  DTDimmedView.m
//  Shapes
//
//  Created by Denys Telezhkin on 23.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "DTDimmingView.h"
#import "CAShapeLayer+UIBezierPath.h"

@interface DTDimmingView()
@property (nonatomic, strong) CAShapeLayer * fillLayer;

@end

@implementation DTDimmingView

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
