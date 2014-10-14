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
#import "NATFavoritesLargeRecipeViewController.h"

@interface NATFavoritesViewController ()

@property (strong, nonatomic) NSArray *filteredBreakfastRecipeArray;
@property (strong, nonatomic) NSMutableArray *breakfastRecipeArray;
@property (strong, nonatomic) NSString *currentFilterString;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation NATFavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //note: when there was only one search bar in the app, setting the delegte explicityly wasn't necessary. It appears that it is neceessary with multiple search bars in an app. 
    self.searchBar.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //this needs to be called near the top of the method to immediately catch deletion in the detail view (when navigated to using the back button)
    [self.collectionView reloadData];
    NSLog(@"ViewWillAppear getting called");
    NSLog(@"There are %d objects in user defaults", [[[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]count]);
    self.breakfastRecipeArray = [NSMutableArray array];
    for (NSData *data in [[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]) {
        NATRecipe *recipe = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if (recipe) {
            [self.breakfastRecipeArray addObject:recipe];
            NSLog(@"recipes found");
            NSLog(@"hello?");
            [self.collectionView reloadData];

        } else {
            NSLog(@"no recipes here");
            NSLog(@"hello?");

            [self.collectionView reloadData];
            return;
        }
    }
    
    //until there's a filter string to use, use the unfiltered array
    self.filteredBreakfastRecipeArray = self.breakfastRecipeArray;

    
}


#pragma mark - Collection View Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.filteredBreakfastRecipeArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NATFavoritesCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NATRecipe *recipe = [self.filteredBreakfastRecipeArray objectAtIndex:indexPath.row];
    cell.label.text = [NSString stringWithFormat:@" %@ : %@", recipe.label, recipe.ingredients[0]] ;
    cell.imageViewForFavorites.image = recipe.recipeImage;
    
    NSLog(@"recipe image has a class of: %@", [recipe.recipeImage class]);
    return cell;
}

#pragma mark - filtering

-(void)setCurrentFilterString:(NSString *)currentFilterString
{
    
    if ([currentFilterString isEqualToString:_currentFilterString ]) {
        return;
    }
    _currentFilterString = currentFilterString;
    if (currentFilterString.length < 1) {
        self.filteredBreakfastRecipeArray = self.breakfastRecipeArray;
        
    } else {
        NSMutableArray *newFilteredArray = [NSMutableArray array];
        
        [self.breakfastRecipeArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NATRecipe *recipe = obj;
            for (NSString *ingredient in recipe.ingredients) {
                if([ingredient containsString:currentFilterString]){
                    [newFilteredArray addObject:recipe];
                    return ;
                }
            }
        }];
        
        self.filteredBreakfastRecipeArray = [NSArray arrayWithArray:newFilteredArray];
        
    }
    [self.collectionView reloadData];
}

#pragma mark - Search bar methods
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length > 2) {
        self.currentFilterString = [searchText lowercaseString];
        [self.collectionView reloadData];
    } else {
        self.currentFilterString = nil;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    NSLog(@"press logged");

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier  isEqualToString:@"favoritesLargeRecipeView"]) {
        NSLog(@"button pressed");
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        NATFavoritesLargeRecipeViewController *destinationViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0]; //the first selected item
        
        NATRecipe *recipe = self.filteredBreakfastRecipeArray[indexPath.row] ;
        destinationViewController.recipe = recipe;
        destinationViewController.recipeLabeltext = recipe.label;
        destinationViewController.recipeImageImage = recipe.recipeImage;
    }
    
}





@end
