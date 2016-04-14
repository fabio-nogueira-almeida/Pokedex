//
//  testMock.m
//  Pokedex
//
//  Created by Fabio Nogueira on 4/6/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <AFNetworking/AFNetworking.h>

#import "GenericMock.h"

@interface testMock : XCTestCase

@end

@implementation testMock

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    // response e verificar se é um pokemon
    
    id mock = [[GenericMock alloc] initMockWithClass:[AFHTTPSessionManager class]
                                                      selector:@selector(GET:parameters:success:failure:)
                                                        result:nil];
    
    [mock GET:@""
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSError *error = nil;
             
//             Pokemon *pokemon = [MTLJSONAdapter modelOfClass:[Pokemon class]
//                                          fromJSONDictionary:responseObject
//                                                       error:&error];
             
             
             NSLog(@"sucesso");
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"error");
         }];
}

@end
