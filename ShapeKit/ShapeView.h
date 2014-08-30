//
//  ShapedView.h
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShapeView : UIView

@property (nonatomic, strong) UIBezierPath * path;
@property (nonatomic, strong, readonly) CAShapeLayer * shapeLayer;

@property (nonatomic, strong) UIColor * fillColor;

@property (nonatomic, strong) UIColor * strokeColor;

@property (nonatomic, assign) BOOL hitTestInsidePath;

@property (nonatomic, copy) NSString *fillRule;

@property (nonatomic, assign) CGFloat strokeStart, strokeEnd;

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) CGFloat miterLimit;

@property (nonatomic, copy) NSString *lineCap;

@property (nonatomic, copy) NSString *lineJoin;

@property (nonatomic, assign) CGFloat lineDashPhase;

@property (nonatomic, copy) NSArray *lineDashPattern;

@end
