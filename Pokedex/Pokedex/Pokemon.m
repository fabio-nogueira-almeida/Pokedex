//
//  Pokemon.m
//  Pokedex
//
//  Created by Fabio Nogueira on 1/10/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

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

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"nationalId" : @"national_id",
             @"resourceUri" : @"resource_uri",
             @"created" : @"created",
             @"modified" : @"modified",
             @"abilities" : @"abilities",
             @"eggGroups" : @"egg_groups",
             @"evolutions" : @"evolutions",
             @"descriptions" : @"descriptions",
             @"moves" : @"moves",
             @"types" : @"types",
             @"catchRate" : @"catch_rate",
             @"species" : @"species",
             @"hp" : @"hp",
             @"attack" : @"attack",
             @"defense" : @"defense",
             @"spAtk" : @"sp_atk",
             @"spDef" : @"sp_def",
             @"speed" : @"speed",
             @"total" : @"total",
             @"sprites" : @"sprites",
             @"eggCycles" : @"egg_cycles",
             @"evYield" : @"ev_yield",
             @"exp" : @"exp",
             @"growthRate" : @"growth_rate",
             @"height" : @"height",
             @"weight" : @"weight",
             @"happiness" : @"happiness",
             @"maleFemalRatio" : @"male_femal_ratio"
         };
}

@end
