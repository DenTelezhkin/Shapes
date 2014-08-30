//
//  RoundDimmedView.h
//  GeoTourist
//
//  Created by Denys Telezhkin on 23.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "DTShapeView.h"

@interface DTDimmedView : DTShapeView

@property (nonatomic, strong) UIBezierPath * visiblePath;
@property (nonatomic, strong) UIBezierPath * dimmedPath;

@property (nonatomic, assign) float opacity;
@property (nonatomic, strong) UIColor * dimmingColor;

@end
