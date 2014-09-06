//
//  DTGraphicsConverter.h
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 06.09.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DTGraphicsConverter : NSObject

+(CGLineCap)lineCapFromCALineCap:(NSString *)lineCap;
+(CGLineJoin)lineJoinFromCALineJoin:(NSString *)lineJoin;

+(NSString *)lineCapFromCGLineCap:(CGLineCap)lineCap;
+(NSString *)lineJoinFromCGLineJoin:(CGLineJoin)lineJoin;

@end
