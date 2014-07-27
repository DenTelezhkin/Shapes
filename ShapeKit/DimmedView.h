//
//  RoundDimmedView.h
//  GeoTourist
//
//  Created by Denys Telezhkin on 23.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ShapedView.h"

@interface DimmedView : ShapedView

-(void)makeVisiblePath:(UIBezierPath *)visiblePath
            dimmedPath:(UIBezierPath *)dimmedPath;

@property (nonatomic, assign) float opacity;
@property (nonatomic, strong) UIColor * dimmingColor;

@end
