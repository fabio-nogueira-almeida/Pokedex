//
//  DataSourceTest.m
//  Pokedex
//
//  Created by Fabio Nogueira on 24/04/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking/AFNetworking.h>

#import "Endpoint.h"
#import "Pokedex.h"

@interface DataSourceTest : XCTestCase

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation DataSourceTest

- (void)setUp {
    [super setUp];
    self.manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"http://pokeapi.co/api/v1/"]];
    self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFetchPokedex {
    XCTestExpectation *expectation = [self expectationWithDescription:@"fetch of pokedex"];
    [self.manager GET:[Endpoint path:EndPointPokemonList]
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
                  XCTAssertEqual(httpResponse.statusCode, 200);
                  [expectation fulfill];
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  XCTFail(@"failure get pokemon list");
              }];
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

@end
