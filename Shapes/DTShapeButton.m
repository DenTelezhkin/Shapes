//
//   DTShapeButton.m
//  Shapes
//
//  Created by Denys Telezhkin on 30.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
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

#import "DTShapeButton.h"

@implementation DTShapeButton

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
