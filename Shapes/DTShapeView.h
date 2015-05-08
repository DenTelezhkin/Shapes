//
//  DTShapeView.h
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

#import <UIKit/UIKit.h>

#import "DTAnimatableShapeLayer.h"

#if __has_feature(nullability) // Xcode 6.3+
#pragma clang assume_nonnull begin
#else
#define nullable
#define __nullable
#endif

/**
 `DTShapeView` is a UIView subclass, that is backed by CAShapeLayer instead of CALayer. It provides API for changing CAShapeLayer path, fill and stroke colors and other layer properties, basically allowing UIView to behave like geometric shape.
 
 All `DTShapeView` properties are automatically converted to CAShapeLayer properties or use CAShapeLayer properties directly. You can use whatever style you like, but we recommend using UIBezierPath and `DTShapeView` properties, because this allows you to completely bypass CoreFoundation objects. It also allows you to use CoreGraphics API instead of QuartzCore.
 */
@interface DTShapeView : UIView

/**
 Setting path property automatically converts all UIBezierPath properties to CAShapeLayer properties.
 */
@property (nonatomic, strong, nullable) UIBezierPath * path;

/**
 CAShapeLayer, that is backing view.
 */
@property (nonatomic, strong, readonly) DTAnimatableShapeLayer * shapeLayer;

/**
 Fill color, used by CAShapeLayer. UIColor is automatically converted to and from CAShapeLayer fillColor property.
 */
@property (nonatomic, strong) IBInspectable UIColor * fillColor;

/**
 Stroke color, used by CAShapeLayer. UIColor is automatically converted to and from CAShapeLayer strokeColor property.
 */
@property (nonatomic, strong) IBInspectable UIColor * strokeColor;

/**
 Fill rule, used by CAShapeLayer. Automatically converts to CAFillRule constant values on CAShapeLayer.
 */
@property (nonatomic, assign) IBInspectable BOOL usesEvenOddFillRule;

/**
 Set CAShapeLayer strokeStart property.
 */
@property (nonatomic, assign) IBInspectable CGFloat strokeStart;

/**
 Set CAShapeLayer strokeEnd property.
 */
@property (nonatomic, assign) IBInspectable CGFloat strokeEnd;

/**
 This property uses CAShapeLayer lineWidth property directly.
 */
@property (nonatomic, assign) IBInspectable CGFloat lineWidth;

/**
 This property uses CAShapeLayer miterLimit property directly.
 */
@property (nonatomic, assign) IBInspectable CGFloat miterLimit;

/**
 This property is automatically converted to QuartzCore line cap constant values on CAShapeLayer.
 */
@property (nonatomic, assign) CGLineCap lineCap;

/**
 This property is automatically converted to QuartzCore line join constant values on CAShapeLayer.
 */
@property (nonatomic, assign) CGLineJoin lineJoin;

/**
 This property uses CAShapeLayer lineDashPhase property directly.
 */
@property (nonatomic, assign) CGFloat lineDashPhase;

/**
 This property uses CAShapeLayer lineDashPattern property directly.
 */
@property (nonatomic, copy) NSArray *lineDashPattern;

/**
 Set this property to YES, if you want to enable hit testing inside CAShapeLayer path.
 
 Default value is NO.
 */
@property (nonatomic, assign) BOOL hitTestInsidePath;

@end

#if __has_feature(nullability)
#pragma clang assume_nonnull end
#endif
