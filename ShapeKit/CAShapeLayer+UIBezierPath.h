//
//  CAShapeLayer+UIBezierPath.h
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 19.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (UIBezierPath)

- (void)dt_updateWithBezierPath:(UIBezierPath *)path;
- (UIBezierPath*)dt_bezierPath;

@end
