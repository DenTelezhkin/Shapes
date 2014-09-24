//
//  VoiceMemosRecordButtonViewController.m
//  ShapesExample
//
//  Created by Denys Telezhkin on 30.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "VoiceMemosRecordButtonViewController.h"
#import "DTShapeView.h"
#import "DTShapeButton.h"
#import "CATransaction+AnimateWithDuration.h"

@interface VoiceMemosRecordButtonViewController ()
@property (weak, nonatomic) IBOutlet DTShapeView *whiteShapeView;
@property (weak, nonatomic) IBOutlet DTShapeButton *recordButton;

@property (nonatomic, assign) BOOL isRecording;
@end

@implementation VoiceMemosRecordButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.whiteShapeView.path = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.whiteShapeView.bounds, 4, 4)];
    self.whiteShapeView.strokeColor = [UIColor whiteColor];
    self.whiteShapeView.lineWidth = 4;
    
    self.recordButton.shape.path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.recordButton.frame, 8, 8) cornerRadius:(self.recordButton.frame.size.width-4)/2];
    self.recordButton.shape.fillColor = [UIColor redColor];
    
    CAShapeLayer * maskLayer = [DTAnimatableShapeLayer layer];
    UIBezierPath * fromPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.recordButton.frame, 0, 0)
                                                         cornerRadius:4];
    maskLayer.path = [fromPath CGPath];
    self.recordButton.shape.shapeLayer.mask = maskLayer;
}

- (IBAction)recordTapped:(id)sender
{
    self.isRecording = !self.isRecording;

    UIBezierPath * fromPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.recordButton.frame, 0, 0)
                                                         cornerRadius:4];
    UIBezierPath * toPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.recordButton.frame, 18, 18)
                                                       cornerRadius:4];
    
    [CATransaction dt_animateWithDuration:0.25
                               animations:^{
                                   if (self.isRecording)
                                   {
                                       [(CAShapeLayer *)self.recordButton.shape.shapeLayer.mask setPath:[toPath CGPath]];
                                   }
                                   else {
                                       [(CAShapeLayer *)self.recordButton.shape.shapeLayer.mask setPath:[fromPath CGPath]];
                                   }
                               } completion:nil];
}

@end
