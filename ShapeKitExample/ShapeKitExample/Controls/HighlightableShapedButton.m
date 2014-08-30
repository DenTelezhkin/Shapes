//
//  RoundCorneredButton.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 25.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "HighlightableShapedButton.h"
#import "ShapeView.h"

@implementation HighlightableShapedButton

-(void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        self.shape.fillColor = self.tintColor;
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    else {
        self.titleLabel.textColor = self.tintColor;
        self.shape.fillColor = [UIColor clearColor];
    }
}

@end
