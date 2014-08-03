//
//  ProgressView.h
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ShapeView.h"

@interface ProgressView : ShapeView

@property (nonatomic, assign, readonly) float progress;

@property (nonatomic, assign, readonly) float strokeStart;

@property (nonatomic, assign, readonly) float strokeEnd;

/**
 Duration of an animated progress change.
 
 Default is 0.3s. Must be larger than zero.
 */
@property (nonatomic, assign) NSTimeInterval animationDuration UI_APPEARANCE_SELECTOR;

@property (nonatomic, strong) CAValueFunction * animationFunction;

/**
 Change progress animated.
 
 The animation will be always linear.
 
 @param progress The new progress value.
 
 @param animated Specify YES to animate the change or NO if you do not want the change to be animated.
 */
- (void)setProgress:(float)progress animated:(BOOL)animated;

- (void)setStrokeStart:(float)start animated:(BOOL)animated;

- (void)setStrokeEnd:(float)end animated:(BOOL)animated;

@end
