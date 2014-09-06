//
//  CAShapeLayer+UIBezierPath.h
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 19.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

/**
 Category on `CAShapeLayer`, that allows setting and getting UIBezierPath on CAShapeLayer.
 */
@interface CAShapeLayer (UIBezierPath)

/**
 Update CAShapeLayer with UIBezierPath.
 */
- (void)dt_updateWithBezierPath:(UIBezierPath *)path;

/**
 Get UIBezierPath object, constructed from CAShapeLayer.
 */
- (UIBezierPath*)dt_bezierPath;

@end
