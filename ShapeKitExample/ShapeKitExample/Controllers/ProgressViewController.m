//
//  ProgressViewController.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 27.07.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "ProgressViewController.h"
#import "DTProgressView.h"

@interface ProgressViewController ()
@property (weak, nonatomic) IBOutlet DTProgressView *simpleProgressView;
@property (weak, nonatomic) IBOutlet DTProgressView *progressView;
@property (weak, nonatomic) IBOutlet DTProgressView *infiniteProgressView;
@property (weak, nonatomic) IBOutlet DTProgressView *ellipseProgressView;

@end

@implementation ProgressViewController

-(void)dealloc
{
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSimpleProgressView];
    [self setupProgressView];
    [self setupInfiniteProgressView];
    [self setupEllipseProgressView];
    
    [self increaseProgress];
}

-(void)setupSimpleProgressView
{
    self.simpleProgressView.strokeColor = [UIColor greenColor];
}

-(void)setupProgressView
{
    self.progressView.strokeColor = [UIColor redColor];
    CGFloat side = self.progressView.bounds.size.width - 5;
    CGRect circleRect = CGRectMake(5, 5, side-5, side-5);
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    self.progressView.path = circlePath;
    self.progressView.shapeLayer.lineWidth = 2;
}

-(void)setupInfiniteProgressView
{
    self.infiniteProgressView.strokeColor = [UIColor blueColor];
    
    CGFloat side = self.infiniteProgressView.bounds.size.width - 5;
    CGRect circleRect = CGRectMake(5, 5, side-5, side-5);
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    path.lineWidth = 1;
    self.infiniteProgressView.path = path;
    [self.infiniteProgressView setStrokeEnd:0.85 animated:NO];
    
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.toValue        = @(1*2*M_PI);
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    spinAnimation.duration       = 1.0;
    spinAnimation.repeatCount    = INFINITY;
    [self.infiniteProgressView.shapeLayer addAnimation:spinAnimation forKey:@"spin animation"];
}

-(void)setupEllipseProgressView
{
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ellipseProgressView.frame.size.width/2, self.ellipseProgressView.frame.size.height)
                                                         radius:self.progressView.frame.size.height
                                                     startAngle:M_PI
                                                       endAngle:0
                                                      clockwise:NO];
    path.lineWidth = 2;
    self.ellipseProgressView.path = path;

    self.ellipseProgressView.strokeColor = [UIColor magentaColor];
}

-(void)increaseProgress
{
    if (self.progressView.progress == 1)
    {
        [self.progressView setProgress:0 animated:NO];
    }
    if (self.simpleProgressView.progress == 1)
    {
        [self.simpleProgressView setProgress:0 animated:NO];
    }
    
    if (self.ellipseProgressView.progress == 1)
    {
        [self.ellipseProgressView setProgress:0 animated:NO];
    }
    float random = (arc4random() % 10)/100.0;

    [self.simpleProgressView setProgress:self.simpleProgressView.progress + random animated:YES];

    [self.progressView setProgress:self.progressView.progress + random  animated:YES];
    [self.ellipseProgressView setProgress:self.ellipseProgressView.progress + random
                                 animated:YES];
 
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.15];
}

@end
