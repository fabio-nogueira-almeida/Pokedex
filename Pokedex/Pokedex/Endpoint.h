//
//  PDEndpoint.h
//  Pokedex
//
//  Created by Fabio Nogueira on 1/26/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    EndPointPokemonIdentifier
} EndPointPokemon;

@interface Endpoint : NSObject

+ (NSString *)path:(EndPointPokemon)endpoint;

+ (NSString *)path:(EndPointPokemon)endpoint
    withIdentifier:(NSInteger)identifier;

@end
