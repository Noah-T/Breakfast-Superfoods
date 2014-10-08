//
//  NATFavoritesViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 10/6/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATFavoritesViewController.h"
#import "NATCollectionViewCell.h"
#import "NATFavoritesCollectionViewCell.h"
#import "NATRecipe.h"

@interface NATFavoritesViewController ()

@property (strong, nonatomic) NSArray *filteredBreakfastRecipeArray;
@property (strong, nonatomic) NSMutableArray *breakfastRecipeArray;
@property (strong, nonatomic) NSString *currentFilterString;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation NATFavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.breakfastRecipeArray = [NSMutableArray array];
    for (NSData *data in [[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]) {
        NATRecipe *recipe = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        NSLog(@"Recipe is: %@", recipe);
        NSLog(@"Recipe image when unarchiving is: %@", recipe.recipeImage);
        [self.breakfastRecipeArray addObject:recipe];
    }
    NSLog(@"the array containds %d objects", self.breakfastRecipeArray.count);
    NSLog(@"The objects are of type: %@", [self.breakfastRecipeArray[0]class]);
}


#pragma mark - Collection View Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.breakfastRecipeArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NATFavoritesCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NATRecipe *recipe = [self.breakfastRecipeArray objectAtIndex:indexPath.row];
    cell.label.text = [NSString stringWithFormat:@" %@ : %@", recipe.label, recipe.ingredients[0]] ;
    cell.imageViewForFavorites.image = recipe.recipeImage;
    
    NSLog(@"recipe image has a class of: %@", [recipe.recipeImage class]);
    return cell;
}


@end
