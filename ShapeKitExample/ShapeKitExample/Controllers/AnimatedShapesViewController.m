//
//  AnimatedShapesViewController.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 25.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import "AnimatedShapesViewController.h"

@interface AnimatedShapesViewController()
@property (nonatomic, assign) BOOL downloadInProgress;
@end

@implementation AnimatedShapesViewController

- (IBAction)downloadTapped:(id)sender
{
    if (self.downloadButton.isDownloading)
    {
        self.downloadButton.downloading = NO;
    }
    else {
        self.downloadButton.downloading = YES;
    }
}

@end
