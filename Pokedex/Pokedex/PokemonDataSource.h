//
//  PokemonDataSource.h
//  Pokedex
//
//  Created by Fabio Nogueira on 14/04/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Pokemon;
@class Pokedex;

typedef void(^pokemonRequestSuccess) (__strong Pokemon *pokemon);
typedef void(^pokedexRequestSuccess) (__strong Pokedex *pokedex);
typedef void(^errorBlock) (__strong NSError *error);

@interface PokemonDataSource : NSObject

- (void)fetchPokemon:(NSInteger)codigo
        successBlock:(pokemonRequestSuccess)successBlock
          errorBlock:(errorBlock)errorBlock;

- (void)fetchPokedex:(pokedexRequestSuccess)successBlock
          errorBlock:(errorBlock)errorBlock;

@end
