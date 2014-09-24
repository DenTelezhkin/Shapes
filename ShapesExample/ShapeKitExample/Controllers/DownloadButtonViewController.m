//
//  AnimatedShapesViewController.m
//  ShapesExample
//
//  Created by Denys Telezhkin on 25.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "DownloadButtonViewController.h"
#import "DTAnimatableShapeLayer.h"
#import "CATransaction+AnimateWithDuration.h"

@interface DownloadButtonViewController()
@property (weak, nonatomic) IBOutlet DTShapeButton *progressButton;
@property (weak, nonatomic) IBOutlet HighlightableShapeButton *downloadButton;
@end

@implementation DownloadButtonViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.downloadButton.shape.path = [UIBezierPath bezierPathWithRoundedRect:self.downloadButton.bounds cornerRadius:5.0f];
    self.progressButton.shape.path = [UIBezierPath bezierPathWithOvalInRect:self.progressButton.bounds];
    
    self.progressButton.shape.strokeEnd = 0.85;
    
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.toValue        = @(1*2*M_PI);
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    spinAnimation.duration       = 1.0;
    spinAnimation.repeatCount    = INFINITY;
    [self.progressButton.shape.shapeLayer addAnimation:spinAnimation forKey:@"spin animation"];
}

- (IBAction)downloadTapped:(id)sender
{
    [self.downloadButton setTitle:@"" forState:UIControlStateNormal];
    
    CGRect frame = CGRectMake(self.downloadButton.frame.origin.x - self.progressButton.frame.size.width-5,
                              0,
                              self.progressButton.frame.size.width+5,
                              self.progressButton.frame.size.height);
    UIBezierPath * roundedPath = [UIBezierPath bezierPathWithRoundedRect:frame
                                                            cornerRadius:10.0];
    [CATransaction dt_animateWithDuration:0.25
                               animations:^{
                                  [self.downloadButton.shape setPath:roundedPath];
                               } completion:^{
                                   self.downloadButton.hidden = YES;
                                   self.progressButton.hidden = NO;
                               }];
}

- (IBAction)progressButtonTapped:(id)sender
{
    self.downloadButton.hidden = NO;
    self.progressButton.hidden = YES;
    
    [CATransaction dt_animateWithDuration:0.25
                               animations:^{
                                   self.downloadButton.shape.path = [UIBezierPath bezierPathWithRoundedRect:self.downloadButton.bounds
                                                                                               cornerRadius:5.0f];
                               } completion:^{
                                   [self.downloadButton setTitle:@"DOWNLOAD" forState:UIControlStateNormal];
                               }];
}

@end
