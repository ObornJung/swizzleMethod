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

- (void)test00_swizzleClassMethod {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    SEL classSel1 = @selector(methodIncrement:);
    SEL classSel2 = @selector(methodDecrement:);
    SEL instanceSel1 = @selector(methodAdd:to:);
    SEL instanceSel2 = @selector(methodMultiply:to:);
    SEL undefineSel1 = NSSelectorFromString(@"undefineMethod1:");
    SEL undefineSel2 = NSSelectorFromString(@"undefineMethod2:");
    
    // step1.tow undefine method swizzle test.
    BOOL isOk = [[self class] sm_swizzleClassMethod:undefineSel1 withMethod:undefineSel2];
    XCTAssert(isOk == NO);
    //
    // step2.An undefine method and an class method swizzle test.
    isOk = [[self class] sm_swizzleClassMethod:undefineSel1 withMethod:classSel1];
    XCTAssert(isOk == NO);
    //
    // step3.An undefine method and an instance method swizzle test.
    isOk = [[self class] sm_swizzleClassMethod:undefineSel1 withMethod:instanceSel1];
    XCTAssert(isOk == NO);
    //
    // step4.An class method and an instance method swizzle test.
    isOk = [[self class] sm_swizzleClassMethod:classSel1 withMethod:instanceSel1];
    XCTAssert(isOk == NO);
    //
    // step5.Tow instance method swizzle test.
    isOk = [[self class] sm_swizzleClassMethod:instanceSel1 withMethod:instanceSel2];
    XCTAssert(isOk == NO);
    //
    // step6.tow instance method swizzle test.
    isOk = [[self class] sm_swizzleClassMethod:classSel1 withMethod:classSel2];
    XCTAssert(isOk == YES);
    NSInteger incrementResult = [[self class] methodIncrement:3];
    NSInteger decrementResult = [[self class] methodDecrement:3];
    XCTAssert(incrementResult == (3 - 1));
    XCTAssert(decrementResult == (3 + 1));
}

- (void)test01_swizzleInstanceMethod {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    //
    SEL classSel1 = @selector(methodIncrement:);
    SEL classSel2 = @selector(methodDecrement:);
    SEL instanceSel1 = @selector(methodAdd:to:);
    SEL instanceSel2 = @selector(methodMultiply:to:);
    SEL undefineSel1 = NSSelectorFromString(@"undefineMethod1:");
    SEL undefineSel2 = NSSelectorFromString(@"undefineMethod2:");

    // step1.tow undefine method swizzle test.
    BOOL isOk = [[self class] sm_swizzleMethod:undefineSel1 withMethod:undefineSel2];
    XCTAssert(isOk == NO);
    //
    // step2.An undefine method and an class method swizzle test.
    isOk = [[self class] sm_swizzleMethod:undefineSel1 withMethod:classSel1];
    XCTAssert(isOk == NO);
    //
    // step3.An undefine method and an instance method swizzle test.
    isOk = [[self class] sm_swizzleMethod:undefineSel1 withMethod:instanceSel1];
    XCTAssert(isOk == NO);
    //
    // step4.An class method and an instance method swizzle test.
    isOk = [[self class] sm_swizzleMethod:classSel1 withMethod:instanceSel1];
    XCTAssert(isOk == NO);
    //
    // step5.Two class method and an instance method swizzle test.
    isOk = [[self class] sm_swizzleMethod:classSel1 withMethod:classSel2];
    XCTAssert(isOk == NO);
    //
    // step6.Tow instance method swizzle test.
    isOk = [[self class] sm_swizzleMethod:instanceSel1 withMethod:instanceSel2];
    XCTAssert(isOk == YES);
    NSInteger addResult = [self methodAdd:2 to:3];
    NSInteger multResult = [self methodMultiply:2 to:3];
    XCTAssert(addResult == 2 * 3);
    XCTAssert(multResult == 2 + 3);
}

+ (NSInteger)methodIncrement:(NSInteger)x {
    return ++ x;
}

+ (NSInteger)methodDecrement:(NSInteger)x {
    return -- x;
}

- (NSInteger)methodAdd:(NSInteger)x to:(NSInteger)y {
    return x + y;
}

- (NSInteger)methodMultiply:(NSInteger)x to:(NSInteger)y {
    return x * y;
}

@end
