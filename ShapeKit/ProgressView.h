//
//  ProgressView.h
//  GeoTourist
//
//  Created by Denys Telezhkin on 17.07.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "ShapedView.h"

@interface ProgressView : ShapedView

-(void)setFrame:(CGRect)frame;

@property (nonatomic, assign) float progress;

@property (nonatomic, strong) UIColor * fillColor;

@end
