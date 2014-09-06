//
//  ShapedView.h
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

/**
 `DTShapeView` is a UIView subclass, that is backed by CAShapeLayer instead of CALayer. It provides API for changing CAShapeLayer path, fill and stroke colors and other layer properties, basically allowing UIView to behave like geometric shape.
 */
@interface DTShapeView : UIView

/**
 Setting path property automatically converts all UIBezierPath properties to CAShapeLayer properties.
 */
@property (nonatomic, strong) UIBezierPath * path;

/**
 CAShapeLayer, that is backing view.
 */
@property (nonatomic, strong, readonly) CAShapeLayer * shapeLayer;

/**
 Fill color, used by CAShapeLayer.
 */
@property (nonatomic, strong) UIColor * fillColor;

/**
 Stroke color, used by CAShapeLayer.
 */
@property (nonatomic, strong) UIColor * strokeColor;

/**
 Fill rule, used by CAShapeLayer.
 */
@property (nonatomic, assign) BOOL usesEvenOddFillRule;

@property (nonatomic, assign) CGFloat strokeStart, strokeEnd;

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) CGFloat miterLimit;

@property (nonatomic, copy) NSString *lineCap;

@property (nonatomic, copy) NSString *lineJoin;

@property (nonatomic, assign) CGFloat lineDashPhase;

@property (nonatomic, copy) NSArray *lineDashPattern;

/**
 
 */
@property (nonatomic, assign) BOOL hitTestInsidePath;

@end
