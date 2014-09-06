//
//  DTGraphicsConverter.h
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 06.09.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 `DTGraphicsConverter` allows converting from CoreGraphics values to Quartz values and vice versa.
 */

@interface DTGraphicsConverter : NSObject

/**
 Convert CALineCap string constant to CGLineCap value.
 */
+(CGLineCap)lineCapFromCALineCap:(NSString *)lineCap;

/**
 Convert CALineJoin string constant to CGLineJoin value.
 */
+(CGLineJoin)lineJoinFromCALineJoin:(NSString *)lineJoin;

/**
 Convert CGLineCap value to CALineCap string constant.
 */
+(NSString *)lineCapFromCGLineCap:(CGLineCap)lineCap;

/**
 Convert CGLineJoin value to CALineCap string constant.
 */
+(NSString *)lineJoinFromCGLineJoin:(CGLineJoin)lineJoin;

@end
