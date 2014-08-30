//
//  CompositedShapesViewController.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 14.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "ImplicitAnimationsViewController.h"
#import "ShapeView.h"

@interface ImplicitAnimationsViewController ()
@property (weak, nonatomic) IBOutlet ShapeView *roundShape;

@end

@implementation ImplicitAnimationsViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBezierPath * roundPath = [UIBezierPath bezierPathWithOvalInRect:self.roundShape.bounds];

    self.roundShape.path = roundPath;
    self.roundShape.strokeColor = [UIColor grayColor];
    self.roundShape.fillColor = [UIColor clearColor];
    self.roundShape.strokeEnd = 0;
    [UIView animateWithDuration:5 animations:^{
        self.roundShape.strokeEnd = 1;
    }];
}

@end
