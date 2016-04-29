//
//  Pokedex.m
//  Pokedex
//
//  Created by Fabio Nogueira on 14/04/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import "Pokedex.h"

#import "Pokemon.h"

@implementation Pokedex

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
        @"name" : @"name",
        @"created" : @"created",
        @"modified" : @"modified",
        @"pokemons" : @"pokemon"
    };
}

#pragma mark - Formatter

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MMM dd, yyyy HH:mm";
    return dateFormatter;
}

#pragma mark - Property Formatter

+ (NSValueTransformer *)createdJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSValueTransformer *)modifiedJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSValueTransformer *)pokemonsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Pokemon class]];
}

@end
