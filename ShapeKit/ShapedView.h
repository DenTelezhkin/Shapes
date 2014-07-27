//
//  ShapedView.h
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShapedView : UIView

@property (nonatomic, strong) UIBezierPath * path;
@property (nonatomic, strong, readonly) CAShapeLayer * shapeLayer;

@end
