//
//  NATRecipeCollectionViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/18/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATRecipeCollectionViewController.h"
#import "NATCollectionViewCell.h"
#import "NATRecipe.h"
#import "NATLargeRecipeViewController.h"
#import "NATUserDefaultInfo.h"

static NSString *const kNATRecipeCellIdentifier = @"kNATRecipeCellIdentifier";

@interface NATRecipeCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>


@property (strong, nonatomic) NSArray *breakfastRecipeArray;
@property (strong, nonatomic) NSArray *filteredBreakfastRecipeArray;
@property (strong, nonatomic) NSString *currentFilterString;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation NATRecipeCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    NATRecipe *auntyPsKaleSaladRecipe = [[NATRecipe alloc]initWithIngredients:@[@"kale"] recipeImage:[UIImage imageNamed:@"aunty-ps-kale-salad"] label:@"Aunty P's Kale Salad"];
    NATRecipe *avocadoBreakfastPuddingRecipe = [[NATRecipe alloc]initWithIngredients:@[@"avocado"] recipeImage:[UIImage imageNamed:@"avocado-breakfast-pudding"] label:@"Avocado Breakfast Pudding"];
    NATRecipe *avocadoBreakfastSaladRecipe = [[NATRecipe alloc]initWithIngredients:@[@"avocado"] recipeImage:[UIImage imageNamed:@"avocado-breakfast-salad"] label:@"Avocado Breakfast Salad"];
    NATRecipe *avocadoKaleSaladRecipe = [[NATRecipe alloc]initWithIngredients:@[@"avocado", @"kale"] recipeImage:[UIImage imageNamed:@"avocado-kale-salad"] label:@"Avocado Kale Salad"];
    NATRecipe *eggBakedInAvocadoRecipe = [[NATRecipe alloc]initWithIngredients:@[@"avocado"] recipeImage:[UIImage imageNamed:@"egg-baked-in-avocado"] label:@"Egg Baked in Avocado"];
    NATRecipe *kaleBananaSmoothieRecipe = [[NATRecipe alloc]initWithIngredients:@[@"kale", @"banana"] recipeImage:[UIImage imageNamed:@"kale-banana-smoothie"] label:@"Kale Banana Smoothie"];
    NATRecipe *kaleSaladWithBloodOrangesRecipe = [[NATRecipe alloc]initWithIngredients:@[@"kale",@"blood oranges"] recipeImage:[UIImage imageNamed:@"kale-salad-with-blood-oranges"] label:@"Kale Salad with Blood Oranges"];

    
    
    self.breakfastRecipeArray = @[auntyPsKaleSaladRecipe, avocadoBreakfastPuddingRecipe, avocadoBreakfastSaladRecipe, avocadoKaleSaladRecipe, eggBakedInAvocadoRecipe, kaleBananaSmoothieRecipe, kaleSaladWithBloodOrangesRecipe];
    
    self.filteredBreakfastRecipeArray = self.breakfastRecipeArray;
    
    NSLog(@" %@", [self.breakfastRecipeArray[0]recipeImage]);
    
    
    
    
    
   
    
    [self.collectionView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.isMovingFromParentViewController) {
        NSLog(@"back is being pressed");
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]count]==0) {
            NSLog(@"there are no items in favorites");
            [self.navigationController popViewControllerAnimated:NO];

        } else {
            NSLog(@"there are items in favorites");
            [self.navigationController popToRootViewControllerAnimated:NO];
        }
    }
}

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

#pragma mark - Table View Methods

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
    NATCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kNATRecipeCellIdentifier forIndexPath:indexPath];
    
    NATRecipe *recipe = self.filteredBreakfastRecipeArray[indexPath.row];
    cell.RecipeCellImageView.image = recipe.recipeImage;
    cell.label.text = recipe.label;
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier  isEqualToString:@"LargeRecipeView"]) {
        NSLog(@"button pressed");
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        NATLargeRecipeViewController *destinationViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0]; //the first selected item
        
        NATRecipe *recipe = self.filteredBreakfastRecipeArray[indexPath.row] ;
        destinationViewController.recipe = recipe;
        destinationViewController.recipeLabeltext = recipe.label;
        destinationViewController.recipeImageImage = recipe.recipeImage;
    }

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length > 2) {
        self.currentFilterString = [searchText lowercaseString];
            } else {
        self.currentFilterString = nil;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
@end
