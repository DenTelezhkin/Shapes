//
//  ProgressViewController.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 27.07.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressView.h"

@interface ProgressViewController ()
@property (weak, nonatomic) IBOutlet ProgressView *progressView;

@end

@implementation ProgressViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.progressView.fillColor = [UIColor redColor];
    CGFloat side = self.progressView.bounds.size.width - 5;
    CGRect circleRect = CGRectMake(5, 5, side-5, side-5);
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    self.progressView.path = circlePath;
    self.progressView.shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    self.progressView.shapeLayer.lineWidth = 2;
    [self increaseProgress];
}

-(void)dealloc
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

-(void)increaseProgress
{
    float random = (arc4random() % 10)/100.0;
    NSLog(@"value: %f",random);
    [self.progressView setProgress:self.progressView.progress + random  animated:YES];
 
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.5];
}

@end
