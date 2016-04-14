//
//  mock.h
//  Pokedex
//
//  Created by Fabio Nogueira on 4/6/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>

@interface GenericMock : NSObject

- (id)initMockWithClass:(Class)clazz
               selector:(SEL)selector
                 result:(id)result;

@end
