//
//  VoiceMemosRecordButtonViewController.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 30.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "VoiceMemosRecordButtonViewController.h"
#import "ShapeView.h"
#import "ShapedButton.h"

@interface VoiceMemosRecordButtonViewController ()
@property (weak, nonatomic) IBOutlet ShapeView *whiteShapeView;
@property (weak, nonatomic) IBOutlet ShapedButton *recordButton;

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
