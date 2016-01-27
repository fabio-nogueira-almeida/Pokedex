//
//  Pokemon.h
//  Pokedex
//
//  Created by Fabio Nogueira on 1/10/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Pokemon : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSNumber *nationalId;
@property (copy, nonatomic) NSString *resourceUri;
@property (copy, nonatomic) NSDate *created;
@property (copy, nonatomic) NSDate *modified;
@property (copy, nonatomic) NSArray *abilities;
@property (copy, nonatomic) NSArray *eggGroups;
@property (copy, nonatomic) NSArray *evolutions;
@property (copy, nonatomic) NSArray *descriptions;
@property (copy, nonatomic) NSArray *moves;
@property (copy, nonatomic) NSArray *types;
@property (copy, nonatomic) NSNumber *catchRate;
@property (copy, nonatomic) NSString *species;
@property (copy, nonatomic) NSNumber *hp;
@property (copy, nonatomic) NSNumber *attack;
@property (copy, nonatomic) NSNumber *defense;
@property (copy, nonatomic) NSNumber *spAtk;
@property (copy, nonatomic) NSNumber *spDef;
@property (copy, nonatomic) NSNumber *speed;
@property (copy, nonatomic) NSNumber *total;
@property (copy, nonatomic) NSArray *sprites;
@property (copy, nonatomic) NSNumber *eggCycles;
@property (copy, nonatomic) NSString *evYield;
@property (copy, nonatomic) NSNumber *exp;
@property (copy, nonatomic) NSString *growthRate;
@property (copy, nonatomic) NSString *height;
@property (copy, nonatomic) NSString *weight;
@property (copy, nonatomic) NSNumber *happiness;
@property (copy, nonatomic) NSString *maleFemalRatio;

@end