//
//  DTAnimatableShapeLayer.m
//  Shapes
//
//  Created by Denys Telezhkin on 31.08.14.
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

#import "DTAnimatableShapeLayer.h"

@implementation DTAnimatableShapeLayer

-(NSMutableSet *)animatableKeys
{
    if (!_animatableKeys)
    {
        _animatableKeys = [NSMutableSet setWithObject:@"path"];
    }
    return _animatableKeys;
}

-(id<CAAction>)actionForKey:(NSString *)key
{
    if ([self.animatableKeys containsObject:key])
    {
        return [self customAnimationForKey:key];
    }
    return [super actionForKey:key];
}

- (CABasicAnimation *) customAnimationForKey: (NSString *) key
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
    animation.fromValue = [self.presentationLayer valueForKey:key];
    animation.duration = [CATransaction animationDuration];
    return animation;
}

@end
