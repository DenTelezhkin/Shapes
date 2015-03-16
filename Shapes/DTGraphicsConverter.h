//
//  DTGraphicsConverter.h
//  Shapes
//
//  Created by Denys Telezhkin on 06.09.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <Foundation/Foundation.h>

#if __has_feature(nullability) // Xcode 6.3+
#pragma clang assume_nonnull begin
#else
#define nullable
#define __nullable
#endif

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

#if __has_feature(nullability)
#pragma clang assume_nonnull end
#endif
