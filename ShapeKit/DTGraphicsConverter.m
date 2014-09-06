//
//  DTGraphicsConverter.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 06.09.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "DTGraphicsConverter.h"

@implementation DTGraphicsConverter

+(NSDictionary *)CGtoCALineCaps
{
    return @{
             @(kCGLineCapSquare) :kCALineCapSquare,
             @(kCGLineCapButt) : kCALineCapButt,
             @(kCGLineCapRound) : kCALineCapRound
             };
}

+(NSDictionary *)CGtoCALineJoins
{
    return @{
             @(kCGLineJoinRound) : kCALineJoinRound,
             @(kCGLineJoinMiter) : kCALineJoinMiter,
             @(kCGLineJoinBevel) : kCALineJoinBevel
             };
}

+(NSDictionary *)CAtoCGLineCaps
{
    return @{
             kCALineCapSquare : @(kCGLineCapSquare),
             kCALineCapButt : @(kCGLineCapButt),
             kCALineCapRound : @(kCGLineCapRound)
             };
}

+(NSDictionary *)CAtoCGLineJoins
{
    return @{
             kCALineJoinRound : @(kCGLineJoinRound),
             kCALineJoinMiter : @(kCGLineJoinMiter),
             kCALineJoinBevel : @(kCGLineJoinBevel)
             };
}

+(NSString *)lineCapFromCGLineCap:(CGLineCap)lineCap
{
    return [self CGtoCALineCaps][@(lineCap)];
}

+(NSString *)lineJoinFromCGLineJoin:(CGLineJoin)lineJoin
{
    return [self CGtoCALineJoins][@(lineJoin)];
}

+(CGLineCap)lineCapFromCALineCap:(NSString *)lineCap
{
    return [[self CAtoCGLineCaps][lineCap] intValue];
}

+(CGLineJoin)lineJoinFromCALineJoin:(NSString *)lineJoin
{
    return [[self CAtoCGLineJoins][lineJoin] intValue];
}

@end
