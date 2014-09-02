//
//  DTAnimatableShapeLayer.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 31.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "DTAnimatableShapeLayer.h"

@implementation DTAnimatableShapeLayer

- (id)actionForKey:(NSString *)event
{
    if ([event isEqualToString:@"path"])
    {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:event];
        animation.duration = [CATransaction animationDuration];
        animation.timingFunction = [CATransaction animationTimingFunction];
        return animation;
    }
    return [super actionForKey:event];
}

@end
