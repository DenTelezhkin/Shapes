//
//  ShapedViewTestCase.m
//  ShapeKitExample
//
//  Created by Denys Telezhkin on 03.08.14.
//  Copyright (c) 2014 Denys Telezhkin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ShapeView.h"

@interface ShapedViewPathTestCase : XCTestCase
@property (nonatomic, strong) ShapeView * view;

@end

@implementation ShapedViewPathTestCase

- (void)setUp
{
    [super setUp];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.miterLimit = 6;
    path.usesEvenOddFillRule = YES;
    
    self.view = [ShapeView new];
    [self.view setPath:path];
}

-(void)testLineWidth
{
    XCTAssert(self.view.shapeLayer.lineWidth == 2);
}

-(void)testLineCapStyle
{
    XCTAssert([self.view.shapeLayer.lineCap isEqualToString:kCALineCapRound]);
}

-(void)testLineJoinStyle
{
    XCTAssert([self.view.shapeLayer.lineJoin isEqualToString:kCALineJoinRound]);
}

-(void)testMiterLimit
{
    XCTAssert(self.view.shapeLayer.miterLimit == 6);
}

-(void)testEvenOddRule
{
    XCTAssert([self.view.shapeLayer.fillRule isEqualToString:kCAFillRuleEvenOdd]);
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

@end
