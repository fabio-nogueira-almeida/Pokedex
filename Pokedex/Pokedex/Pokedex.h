//
//  Pokedex.h
//  Pokedex
//
//  Created by Fabio Nogueira on 14/04/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Pokedex : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSDate *created;
@property (copy, nonatomic) NSDate *modified;

@property (strong, nonatomic) NSArray *pokemons;

@end
