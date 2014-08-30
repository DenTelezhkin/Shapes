//
//  ShapedButton.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 30.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "DTShapedButton.h"

@implementation DTShapedButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self commonSetup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self commonSetup];
    }
    return self;
}

-(void)commonSetup
{
    DTShapeView * buttonShape = [[DTShapeView alloc] initWithFrame:self.bounds];
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:self.bounds];
    buttonShape.path = path;
    
    [self addSubview:buttonShape];
    self.shape = buttonShape;
    self.shape.userInteractionEnabled = NO;
    self.shape.exclusiveTouch = NO;
    
    buttonShape.fillColor = [UIColor clearColor];
    buttonShape.strokeColor = self.tintColor;
}

@end
