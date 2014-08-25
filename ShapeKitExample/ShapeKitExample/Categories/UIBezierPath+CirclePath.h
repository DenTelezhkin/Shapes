//
//  UIBezierPath+CirclePath.h
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 25.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (CirclePath)

+(instancetype)dt_bezierPathWithOvalInRect:(CGRect)rect splitInParts:(NSInteger)numberOfParts;

+(instancetype)dt_bezierPathWithPartialDrawingInRoundedRect:(CGRect)rect cornerRadius:(CGFloat)radius;

@end
