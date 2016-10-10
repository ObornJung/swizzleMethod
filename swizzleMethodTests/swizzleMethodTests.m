//
//  swizzleMethodTests.m
//  swizzleMethodTests
//
//  Created by Oborn.Jung on 16/10/10.
//  Copyright © 2016年 atg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+swizzle.h"

@interface swizzleMethodTests : XCTestCase

@end

@implementation swizzleMethodTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSwizzleInstanceMethod {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [[self class] sm_swizzleMethod:@selector(methodAdd:to:) withMethod:@selector(methodMultiply:to:)];
    NSInteger addResult = [self methodAdd:2 to:3];
    NSInteger multResult = [self methodMultiply:2 to:3];
    XCTAssert(addResult == 2 * 3);
    XCTAssert(multResult == 2 + 3);
}

- (NSInteger)methodAdd:(NSInteger)x to:(NSInteger)y {
    return x + y;
}

- (NSInteger)methodMultiply:(NSInteger)x to:(NSInteger)y {
    return x * y;
}

- (void)testSwizzleClassMethod {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [[self class] sm_swizzleClassMethod:@selector(methodIncrement:) withMethod:@selector(methodDecrement:)];
    NSInteger incrementResult = [[self class] methodIncrement:3];
    NSInteger decrementResult = [[self class] methodDecrement:3];
    XCTAssert(incrementResult == (3 - 1));
    XCTAssert(decrementResult == (3 + 1));
}

+ (NSInteger)methodIncrement:(NSInteger)x {
    return ++ x;
}

+ (NSInteger)methodDecrement:(NSInteger)x {
    return -- x;
}

@end
