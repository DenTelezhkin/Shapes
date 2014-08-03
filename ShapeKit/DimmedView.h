//
//  RoundDimmedView.h
//  GeoTourist
//
//  Created by Denys Telezhkin on 23.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ShapeView.h"

@interface DimmedView : ShapeView

-(void)makeVisiblePath:(UIBezierPath *)visiblePath
            dimmedPath:(UIBezierPath *)dimmedPath;

@property (nonatomic, assign) float opacity;
@property (nonatomic, strong) UIColor * dimmingColor;

@end
