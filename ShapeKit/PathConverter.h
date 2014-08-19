//
//  PathConverter.h
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 10.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathConverter : NSObject

+(void)updateShapeLayer:(CAShapeLayer *)shapeLayer
         withBezierPath:(UIBezierPath *)path;

@end
