//
//  ShapedViewGettersAndSettersTestCase.m
//  ShapesExample
//
//  Created by Denys Telezhkin on 06.09.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTShapeView.h"

@interface ShapedViewGettersAndSettersTestCase : XCTestCase
@property (nonatomic, strong) DTShapeView * view;

@end

@implementation ShapedViewGettersAndSettersTestCase

- (void)setUp
{
    [super setUp];
    self.view = [DTShapeView new];
}

-(void)testFillColor
{
    [self.view setFillColor:[UIColor redColor]];
    UIColor * color = [UIColor colorWithCGColor:self.view.shapeLayer.fillColor];
    XCTAssert([color isEqual:[UIColor redColor]]);
}

-(void)testStrokeColor
{
    [self.view setStrokeColor:[UIColor blueColor]];
    UIColor * color = [UIColor colorWithCGColor:self.view.shapeLayer.strokeColor];
    XCTAssert([color isEqual:[UIColor blueColor]]);
}

-(void)testUsesEvenOddFillRule
{
    [self.view setUsesEvenOddFillRule:YES];
    XCTAssert([self.view.shapeLayer.fillRule isEqualToString:kCAFillRuleEvenOdd]);
}

-(void)testFillRuleNonZero
{
    [self.view setUsesEvenOddFillRule:NO];
    XCTAssert([self.view.shapeLayer.fillRule isEqualToString:kCAFillRuleNonZero]);
}

-(void)testLineCap
{
    self.view.lineCap = kCGLineCapRound;
    XCTAssert([self.view.shapeLayer.lineCap isEqualToString:kCALineCapRound]);
    
    self.view.lineCap = kCGLineCapButt;
    XCTAssert([self.view.shapeLayer.lineCap isEqualToString:kCALineCapButt]);
}

-(void)testLineJoin
{
    self.view.lineJoin = kCGLineJoinBevel;
    XCTAssert([self.view.shapeLayer.lineJoin isEqualToString:kCALineJoinBevel]);
    
    self.view.lineJoin = kCGLineJoinMiter;
    XCTAssert([self.view.shapeLayer.lineJoin isEqualToString:kCALineJoinMiter]);
}

@end
