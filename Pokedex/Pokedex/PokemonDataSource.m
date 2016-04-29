//
//  PokemonDataSource.m
//  Pokedex
//
//  Created by Fabio Nogueira on 14/04/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import "PokemonDataSource.h"
#import "Pokemon.h"
#import "Pokedex.h"

#import "Endpoint.h"
#import <AFNetworking/AFNetworking.h>

@interface PokemonDataSource ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation PokemonDataSource

#pragma mark - Getter

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"http://pokeapi.co/api/v1/"]];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    
    return _manager;
}

#pragma mark - Public

- (void)fetchPokemon:(NSInteger)codigo
        successBlock:(pokemonRequestSuccess)successBlock
          errorBlock:(errorBlock)errorBlock {
    [self.manager GET:[Endpoint path:EndPointPokemonIdentifier withIdentifier:codigo]
           parameters:nil
             progress:nil
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        Pokemon *pokemon = [MTLJSONAdapter modelOfClass:[Pokemon class]
                                     fromJSONDictionary:responseObject
                                                  error:&error];
        if (successBlock) {
            successBlock(pokemon);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) errorBlock(error);
    }];
}

- (void)fetchPokedex:(pokedexRequestSuccess)successBlock
          errorBlock:(errorBlock)errorBlock {
    [self.manager GET:[Endpoint path:EndPointPokemonList]
           parameters:nil
             progress:nil
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        Pokedex *pokedex = [MTLJSONAdapter modelOfClass:[Pokedex class]
                                     fromJSONDictionary:responseObject
                                                  error:&error];
        if (successBlock) {
            successBlock(pokedex);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) errorBlock(error);
    }];
}

@end
