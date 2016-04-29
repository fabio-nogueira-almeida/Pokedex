//
//  PokedexController.m
//  Pokedex
//
//  Created by Fabio Nogueira on 14/04/16.
//  Copyright © 2016 Fabio Nogueira. All rights reserved.
//

#import "PokedexController.h"
#import "Pokedex.h"
#import "Pokemon.h"
#import "PokemonDataSource.h"

@interface PokedexController ()

@property (strong, nonatomic) Pokedex *pokedex;
@property (strong, nonatomic) PokemonDataSource *dataSource;

@end

@implementation PokedexController

#pragma mark - Getter

- (PokemonDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [[PokemonDataSource alloc] init];
    }
    
    return _dataSource;
}

#pragma mark - Private

- (void)fetchPokedex{
    [self.dataSource fetchPokedex:^(Pokedex *pokedex) {
        self.pokedex = pokedex;
        [self.tableView reloadData];
    } errorBlock:nil];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self fetchPokedex];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pokedex.pokemons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pokemonCell"];
    Pokemon *pokemon = [self.pokedex.pokemons objectAtIndex:indexPath.row];
    cell.textLabel.text = pokemon.name;
    return cell;
}

#pragma mark - StatusBar

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
