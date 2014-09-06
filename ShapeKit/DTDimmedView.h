//
//  RoundDimmedView.h
//
//  Created by Denys Telezhkin on 23.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTShapeView.h"

/**
 `DTDimmedView` allows dimming part of the view, by "cutting" visible path from it. By default, dimming path contains entire UIView bounds. Create UIBezierPath, that describes, which part of the view should be visible, and set it on `DTDimmedView` instance to allow content to be seen.
 */
@interface DTDimmedView : DTShapeView

/**
 UIBezierPath, that describes, which part of the content should be visible. It must be completely inside dimmedPath for dimming to work.
 */
@property (nonatomic, strong) UIBezierPath * visiblePath;

/**
 UIBezierPath, that describes, which part of the view should be dimmed. By default, entire view is dimmed.
 */
@property (nonatomic, strong) UIBezierPath * dimmedPath;

/**
 Opacity for dimming view. 0.9 by default.
 */
@property (nonatomic, assign) float dimmingOpacity UI_APPEARANCE_SELECTOR;

/**
 Color of a dimming view. [UIColor blackColor] by default.
 */
@property (nonatomic, strong) UIColor * dimmingColor UI_APPEARANCE_SELECTOR;

@end
