//
//  RoundCorneredButton.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 25.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "DownloadButton.h"
#import "ShapeView.h"
#import "UIBezierPath+CirclePath.h"

@interface DownloadButton()
@property (nonatomic, strong) ShapeView * buttonShape;
@property (nonatomic, assign) CGRect defaultFrame;
@property (nonatomic, strong) NSString * title;

@end

@implementation DownloadButton

-(void)commonSetup
{
    ShapeView * buttonShape = [[ShapeView alloc] initWithFrame:self.bounds];
    UIBezierPath * path = [self defaultPath];
    buttonShape.path = path;
    
    [self addSubview:buttonShape];
    self.buttonShape = buttonShape;
    self.buttonShape.userInteractionEnabled = NO;
    self.buttonShape.exclusiveTouch = NO;
    
    buttonShape.fillColor = [UIColor clearColor];
    buttonShape.strokeColor = self.tintColor;
    
    self.defaultFrame = self.frame;
    self.title = self.titleLabel.text;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder])
    {
        [self commonSetup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self commonSetup];
    }
    return self;
}

-(UIBezierPath *)downloadingPath
{
    return [UIBezierPath dt_bezierPathWithOvalInRect:self.bounds
                                        splitInParts:12];
}

-(UIBezierPath *)defaultPath
{
    return [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:5.0f];
}

-(void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        self.buttonShape.fillColor = self.tintColor;
        self.titleLabel.textColor = [UIColor whiteColor];
    }
    else {
        self.titleLabel.textColor = self.tintColor;
        self.buttonShape.fillColor = [UIColor clearColor];
    }
}

-(void)setDownloading:(BOOL)downloading
{
    _downloading = downloading;
    
    if (downloading)
    {
        [self setTitle:@"" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.25
                         animations:^{
                             self.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - self.frame.size.height,
                                                     self.frame.origin.y,
                                                     self.bounds.size.height,
                                                     self.bounds.size.height);
                             self.buttonShape.path = [self downloadingPath];
                         }];
    }
    else
    {
        [self setTitle:self.title forState:UIControlStateNormal];
        [UIView animateWithDuration:0.25
                         animations:^{
                             self.frame = self.defaultFrame;
                             self.buttonShape.path = [self defaultPath];
                         }];
    }
}

@end
