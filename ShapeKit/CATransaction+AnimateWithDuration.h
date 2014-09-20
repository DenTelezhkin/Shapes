//
//  CATransaction+AnimateWithDuration.h
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 20.09.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CATransaction (AnimateWithDuration)

+(void)dt_animateWithDuration:(NSTimeInterval)duration
                   animations:(void (^)(void))animations
                   completion:(void (^)())completion;

@end
