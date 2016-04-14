//
//  mock.m
//  Pokedex
//
//  Created by Fabio Nogueira on 4/6/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import "GenericMock.h"

@interface GenericMock ()

@property (strong, nonatomic) Class clazz;
@property (nonatomic) SEL selector;



@end

@implementation GenericMock

#pragma mark - Initialize

- (id)initMockWithClass:(Class)clazz
               selector:(SEL)selector
                 result:(id)result {
    self = [super init];
    if (self) {
        self.clazz = clazz;
        self.selector = selector;
        
        
    }
    
    return self;
}

#pragma mark - NSProxy

- (void)forwardInvocation:(NSInvocation *)anInvocatio {

}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
//    id xpto = [super methodSignatureForSelector:sel];
//    if (!xpto && sel == self.selector) {
//        [self.clazz methodSignatureForSelector:self.selector];
//    }
//    
//    return xpto;
//}
//
//- (BOOL)respondsToSelector:(SEL)aSelector {
//    BOOL xpto = [super respondsToSelector:aSelector];
//    if (!xpto && aSelector == self.selector) {
//        xpto = true;
//    }
//    
//    return xpto;
//}

@end
