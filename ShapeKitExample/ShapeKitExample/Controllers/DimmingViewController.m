//
//  DimmingViewController.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 10.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "DimmingViewController.h"
#import "DimmedView.h"

@interface DimmingViewController ()
@property (nonatomic, strong) DimmedView * dimmingDynamicView;

@end

@implementation DimmingViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBezierPath * roundedPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(158, 251, 100, 100)];
    
    self.dimmingDynamicView = [DimmedView new];
    self.dimmingDynamicView.opacity = 0.7;
    self.dimmingDynamicView.frame = self.view.bounds;
    self.dimmingDynamicView.visiblePath = roundedPath;
    [self.view addSubview:self.dimmingDynamicView];
}

- (IBAction)panGestureMoved:(UIPanGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    
    self.dimmingDynamicView.visiblePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(location.x-50, location.y-50,
                                                                                            100, 100)];
}


@end
