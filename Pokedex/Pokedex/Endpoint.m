//
//  PDEndpoint.m
//  Pokedex
//
//  Created by Fabio Nogueira on 1/26/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import "Endpoint.h"

@implementation Endpoint

+ (NSString *)path:(EndPointPokemon)endpoint {
    NSString *path = nil;
    switch (endpoint) {
        case EndPointPokemonIdentifier:
            path = @"pokemon/";
            break;
            
        default:
            break;
    }
    return path;
}

+ (NSString *)path:(EndPointPokemon)endpoint
    withIdentifier:(NSInteger)identifier {
    return [[self path:endpoint] stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)identifier]];
}

@end
