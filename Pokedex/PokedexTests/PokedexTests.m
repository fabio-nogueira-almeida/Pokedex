//
//  PokedexTests.m
//  PokedexTests
//
//  Created by Fabio Nogueira on 1/9/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>g

@interface PokedexTests : XCTestCase

@end

@implementation PokedexTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    UIViewController *viewController = [[UIViewController alloc] init];
    id viewControllerMock = OCMClassMock([UIViewController class]);
}

@end
