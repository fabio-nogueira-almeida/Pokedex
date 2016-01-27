//
//  ViewController.m
//  Pokedex
//
//  Created by Fabio Nogueira on 1/9/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import "ViewController.h"

#import "Endpoint.h"
#import "Pokemon.h"

#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://pokeapi.co/api/v1/"]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:[Endpoint path:EndPointPokemonCodigo withIdentifier:2]
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

             NSError *error = nil;

             Pokemon *pokemon = [MTLJSONAdapter modelOfClass:[Pokemon class]
                                          fromJSONDictionary:responseObject
                                                       error:&error];

             
             NSLog(@"sucesso");
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"error");
         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
