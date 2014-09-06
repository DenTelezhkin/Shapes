//
//  ProgressView.h
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTShapeView.h"

/**
 `DTProgressView` is a `DTShapeView` subclass, that allow animating progress views of any shape. `DTProgressView` uses `DTShapeView` path as track. Stroke start and stroke end properties provide ability to change progress state of a view.
 
 By default, progress view fills entire view frame, animating progress from left to right.
 */
@interface DTProgressView : DTShapeView

/**
 `DTProgressView` progress. Value range from 0 to 1, 0 by default.
 */
@property (nonatomic, assign, readonly) float progress;

/**
 Duration of an animated progress change.
 
 Default is 0.3s.
 */
@property (nonatomic, assign) NSTimeInterval animationDuration UI_APPEARANCE_SELECTOR;

/**
 Animation function to use, when animating progress change.
 */
@property (nonatomic, strong) CAValueFunction * animationFunction;

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
