//
//  AnimatedShapesViewController.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 25.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "AnimatedShapesViewController.h"

@interface AnimatedShapesViewController()
@property (weak, nonatomic) IBOutlet ShapedButton *progressButton;
@property (weak, nonatomic) IBOutlet HighlightableShapedButton *downloadButton;
@end

@implementation AnimatedShapesViewController

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
    [UIView animateWithDuration:0.25
                     animations:^{
                         CGRect frame = CGRectMake(self.downloadButton.frame.origin.x - self.progressButton.frame.size.width,
                                                   0,
                                                   self.progressButton.frame.size.width,
                                                   self.progressButton.frame.size.height);
                         self.downloadButton.shape.path = [UIBezierPath bezierPathWithRoundedRect:frame
                                                                                     cornerRadius:self.progressButton.frame.size.height/2];
                     } completion:^(BOOL finished) {
                         self.downloadButton.hidden = YES;
                         self.progressButton.hidden = NO;
                     }];
}

- (IBAction)progressButtonTapped:(id)sender
{
    self.downloadButton.hidden = NO;
    self.progressButton.hidden = YES;
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.downloadButton.shape.path = [UIBezierPath bezierPathWithRoundedRect:self.downloadButton.bounds
                                                                                     cornerRadius:5.0f];
                     }
                     completion:^(BOOL finished) {
                         if (finished)
                         {
                             [self.downloadButton setTitle:@"DOWNLOAD" forState:UIControlStateNormal];
                         }
                     }];
}

@end
