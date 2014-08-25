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

@end
