//
//  DTProgressView.h
//  Shapes
//
//  Created by Denys Telezhkin on 17.07.14.
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

#import "DTShapeView.h"

#if __has_feature(nullability) // Xcode 6.3+
#pragma clang assume_nonnull begin
#else
#define nullable
#define __nullable
#endif

/**
 `DTProgressView` is a `DTShapeView` subclass, that allow animating progress views of any shape. `DTProgressView` uses `DTShapeView` path as track. Stroke start and stroke end properties provide ability to change progress state of a view.
 
 By default, progress view fills entire view frame, animating progress from left to right.
 */
@interface DTProgressView : DTShapeView

/**
 `DTProgressView` progress. Value range from 0 to 1, 0 by default.
 */
@property (nonatomic, assign, readonly) IBInspectable float progress;

/**
 Duration of an animated progress change.
 
 Default is 0.3s.
 */
@property (nonatomic, assign) NSTimeInterval animationDuration UI_APPEARANCE_SELECTOR;

/**
 Animation function to use, when animating progress change.
 */
@property (nonatomic, strong, nullable) CAValueFunction * animationFunction;

/**
 Set progress value. This method is an alias for setStrokeEnd:animated:.
 
 @param progress The new progress value.
 
 @param animated Specify YES to animate the change or NO if you do not want the change to be animated.
 */
- (void)setProgress:(float)progress animated:(BOOL)animated;

/**
 Set stroke start value.
 
 @param progress The new progress value.
 
 @param animated Specify YES to animate the change or NO if you do not want the change to be animated.
 */
- (void)setStrokeStart:(float)start animated:(BOOL)animated;

/**
 Set strokeEnd value. This method is an alias for setProgress:animated:.
 
 @param progress The new strokeEnd value.
 
 @param animated Specify YES to animate the change or NO if you do not want the change to be animated.
 */
- (void)setStrokeEnd:(float)end animated:(BOOL)animated;

@end

#if __has_feature(nullability)
#pragma clang assume_nonnull end
#endif
