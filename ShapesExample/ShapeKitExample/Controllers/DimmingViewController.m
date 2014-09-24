//
//  DimmingViewController.m
//  ShapesExample
//
//  Created by Denys Telezhkin on 10.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "DimmingViewController.h"
#import "DTDimmingView.h"

@interface DimmingViewController ()
@property (weak, nonatomic) IBOutlet DTDimmingView *dimmingDynamicView;

@end

@implementation DimmingViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBezierPath * roundedPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(158, 251, 100, 100)];
    self.dimmingDynamicView.dimmingOpacity = 0.7;
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
