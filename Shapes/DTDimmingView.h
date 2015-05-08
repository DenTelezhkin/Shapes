//
//  DTDimmedView.h
//  Shapes
//
//  Created by Denys Telezhkin on 23.07.14.
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

#import <UIKit/UIKit.h>

#if __has_feature(nullability) // Xcode 6.3+
#pragma clang assume_nonnull begin
#else
#define nullable
#define __nullable
#endif

/**
 `DTDimmingView` allows dimming part of the view, by "cutting" visible path from it. By default, dimming path contains entire UIView bounds. Create UIBezierPath, that describes, which part of the view should be visible, and set it on `DTDimmingView` instance to allow content to be seen.
 */
@interface DTDimmingView : UIView

/**
 UIBezierPath, that describes, which part of the content should be visible. It must be completely inside dimmedPath for dimming to work.
 */
@property (nonatomic, strong, nullable) UIBezierPath * visiblePath;

/**
 UIBezierPath, that describes, which part of the view should be dimmed. By default, entire view is dimmed.
 */
@property (nonatomic, strong, null_resettable) UIBezierPath * dimmedPath;

/**
 Opacity for dimming view. 0.9 by default.
 */
@property (nonatomic, assign) float dimmingOpacity UI_APPEARANCE_SELECTOR;

/**
 Color of a dimming view. [UIColor blackColor] by default.
 */
@property (nonatomic, strong, nullable) UIColor * dimmingColor UI_APPEARANCE_SELECTOR;

@end

#if __has_feature(nullability)
#pragma clang assume_nonnull end
#endif
