//
//  VoiceMemosRecordButtonViewController.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 30.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "VoiceMemosRecordButtonViewController.h"
#import "DTShapeView.h"
#import "DTShapedButton.h"

@interface VoiceMemosRecordButtonViewController ()
@property (weak, nonatomic) IBOutlet DTShapeView *whiteShapeView;
@property (weak, nonatomic) IBOutlet DTShapedButton *recordButton;

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
}

- (IBAction)recordTapped:(id)sender
{
    self.isRecording = !self.isRecording;

//    UIBezierPath * fromPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.recordButton.frame, 0, 0)
//                                                         cornerRadius:4];
//    UIBezierPath * toPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.recordButton.frame, 18, 18)
//                                                       cornerRadius:4];
//    CAShapeLayer * maskLayer = [CAShapeLayer layer];
//    
//    
//    CABasicAnimation * maskAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
//    maskAnimation.duration = 0.2;
//    maskAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//
//    if (self.isRecording)
//    {
//        [maskLayer setPath:[fromPath CGPath]];
//        maskLayer.path = [toPath CGPath];
//        self.recordButton.shape.shapeLayer.mask = maskLayer;
//        maskAnimation.fromValue =(id)[fromPath CGPath];
//        maskAnimation.toValue = (id)[toPath CGPath];
//        maskLayer.path = [toPath CGPath];
//    }
//    else {
//        [maskLayer setPath:[fromPath CGPath]];
//        maskLayer.path = [fromPath CGPath];
//        self.recordButton.shape.shapeLayer.mask = maskLayer;
//        maskAnimation.fromValue =(id)[toPath CGPath];
//        maskAnimation.toValue = (id)[fromPath CGPath];
//    }
//    [maskLayer addAnimation:maskAnimation forKey:@"path"];
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (self.isRecording)
        {
            self.recordButton.shape.path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.recordButton.frame, 20, 20)
                                                                      cornerRadius:2];
        }
        else {
            self.recordButton.shape.path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(self.recordButton.frame, 8, 8)
                                                                      cornerRadius:(self.recordButton.frame.size.width-4)/2];
        }
    } completion:nil];

}

@end
