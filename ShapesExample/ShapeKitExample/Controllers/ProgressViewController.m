//
//  ProgressViewController.m
//  ShapesExample
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
@property (weak, nonatomic) IBOutlet DTProgressView *verticalProgressView;

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
    [self setupVerticalRoundedProgressView];
    
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
    self.progressView.lineWidth = 2;
}

-(void)setupInfiniteProgressView
{
    // Does not seem to work properly on iOS 8.4 and iOS 9
    
    
//    self.infiniteProgressView.strokeColor = [UIColor blueColor];
//    
//    CGFloat side = self.infiniteProgressView.bounds.size.width - 5;
//    CGRect circleRect = CGRectMake(5, 5, side-5, side-5);
//    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:circleRect];
//    path.lineWidth = 1;
//    self.infiniteProgressView.path = path;
//    [self.infiniteProgressView setStrokeEnd:0.85 animated:NO];
    
//    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    spinAnimation.fromValue = @0;
//    spinAnimation.toValue        = @(M_PI*2);
//    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    spinAnimation.duration       = 10.0;
//    spinAnimation.cumulative = YES;
//    spinAnimation.repeatCount    = INFINITY;
//    [self.infiniteProgressView.shapeLayer addAnimation:spinAnimation forKey:@"spin animation"];
}

-(void)setupVerticalRoundedProgressView
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.verticalProgressView.bounds.size.width/2, 0)];
    [path addLineToPoint:CGPointMake(self.verticalProgressView.bounds.size.width/2,
                                     self.verticalProgressView.frame.size.height)];

    path.lineWidth = 5;
    self.verticalProgressView.path = path;
    self.verticalProgressView.lineCap = kCGLineCapRound;
    
    self.verticalProgressView.strokeColor = [UIColor grayColor];
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
        [self.simpleProgressView setProgress:0 animated:NO];
        [self.ellipseProgressView setProgress:0 animated:NO];
        [self.verticalProgressView setProgress:0 animated:NO];
    }
    float random = (arc4random() % 10)/100.0;

    float progress = self.simpleProgressView.progress + random;
    
    [self.simpleProgressView setProgress:progress animated:YES];
    [self.progressView setProgress:progress animated:YES];
    [self.ellipseProgressView setProgress:progress animated:YES];
    [self.verticalProgressView setProgress:progress animated:YES];
 
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.15];
}

@end
