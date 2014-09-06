//
//  ShapedButton.h
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 30.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "DTShapeView.h"

/**
 `DTShapedButton` is a UIButton, that has `DTShapedView` added as a sublayer. As a result, it allows manipulating UIButton shape and visual appearance by changing `DTShapedView` properties. By default, button shape is a rectangle with UIButton bounds set as it's frame.
 */
@interface DTShapedButton : UIButton

/**
 `DTShapeView`, added as a sublayer to UIButton's layer. 
 */
@property (nonatomic, strong) DTShapeView * shape;

@end
