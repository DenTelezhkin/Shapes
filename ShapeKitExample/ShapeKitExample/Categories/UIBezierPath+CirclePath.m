//
//  UIBezierPath+CirclePath.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 25.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "UIBezierPath+CirclePath.h"

@implementation UIBezierPath (CirclePath)

+(instancetype)dt_bezierPathWithOvalInRect:(CGRect)rect splitInParts:(NSInteger)numberOfParts
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    for (int i = 0; i<numberOfParts; i ++)
    {
        [path addArcWithCenter:CGPointMake(rect.size.width/2, rect.size.height/2)
                        radius:rect.size.height/2
                    startAngle:i*(2 * M_PI/(float)numberOfParts)
                      endAngle:(i+1)*(2 * M_PI/(float)numberOfParts)
                     clockwise:YES];
    }
    
    return path;
}

+(instancetype)dt_bezierPathWithPartialDrawingInRoundedRect:(CGRect)rect cornerRadius:(CGFloat)radius
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(rect.size.width, radius)];
    
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height - radius)];
    [path addArcWithCenter:CGPointMake(rect.size.width - radius, rect.size.height - radius)
                    radius:radius
                startAngle:0
                  endAngle:M_PI_2
                 clockwise:YES];
    [path addLineToPoint:CGPointMake(radius, rect.size.height)];
    [path addArcWithCenter:CGPointMake(radius, rect.size.height - radius)
                    radius:radius
                startAngle:M_PI_2
                  endAngle:M_PI
                 clockwise:YES];
    [path addLineToPoint:CGPointMake(0, radius)];
    [path addArcWithCenter:CGPointMake(radius, radius)
                    radius:radius
                startAngle:M_PI
                  endAngle:3* M_PI_2
                 clockwise:YES];
    
    [path moveToPoint:CGPointMake(radius, 0)];
    [path addLineToPoint:CGPointMake(rect.size.width - radius,0)];
    [path addArcWithCenter:CGPointMake(rect.size.width - radius, radius)
                    radius:radius
                startAngle:3 * M_PI_2
                  endAngle:2 * M_PI
                 clockwise:YES];

    return path;
}

@end
