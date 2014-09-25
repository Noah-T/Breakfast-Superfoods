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

@interface NATRecipeCollectionViewController ()

@property (strong, nonatomic) NSArray *breakfastPictureArray;
@property (strong, nonatomic) NSArray *breakfastRecipeArray;
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
    UIImage *auntyPsKaleSalad = [UIImage imageNamed:@"aunty-ps-kale-salad"];
    UIImage *avocadoBreakfastPudding = [UIImage imageNamed:@"avocado-breakfast-pudding"];
    UIImage *avocadoBreakfastSalad = [UIImage imageNamed:@"avocado-breakfast-salad"];
    UIImage *avocadoKaleSalad = [UIImage imageNamed:@"avocado-kale-salad"];
    UIImage *eggBakedInAvocado = [UIImage imageNamed:@"egg-baked-in-avocado"];
    UIImage *kaleBananaSmoothie = [UIImage imageNamed:@"kale-banana-smoothie"];
    UIImage *kaleSaladWithBloodOranges = [UIImage imageNamed:@"kale-salad-with-blood-oranges"];
    UIImage *tomatoAvocadoToast = [UIImage imageNamed:@"tomato-avocado-toast"];
    
    NATRecipe *auntyPsKaleSaladRecipe = [[NATRecipe alloc]initWithIngredients:@[@"kale"] recipeImage:[UIImage imageNamed:@"aunty-ps-kale-salad"] label:@"Aunty P's Kale Salad"];
    NATRecipe *avocadoBreakfastPuddingRecipe = [[NATRecipe alloc]initWithIngredients:@[@"avocado"] recipeImage:[UIImage imageNamed:@"avocado-breakfast-pudding"] label:@"Avocado Breakfast Pudding"];
    NATRecipe *avocadoBreakfastSaladRecipe = [[NATRecipe alloc]initWithIngredients:@[@"avocado"] recipeImage:[UIImage imageNamed:@"avocado-breakfast-salad"] label:@"Avocado Breakfast Salad"];
    NATRecipe *avocadoKaleSaladRecipe = [[NATRecipe alloc]initWithIngredients:@[@"avocado", @"kale"] recipeImage:[UIImage imageNamed:@"avocado-kale-salad"] label:@"Avocado Kale Salad"];
    NATRecipe *eggBakedInAvocadoRecipe = [[NATRecipe alloc]initWithIngredients:@[@"avocado"] recipeImage:[UIImage imageNamed:@"egg-baked-in-avocado"] label:@"Egg Baked in Avocado"];
    NATRecipe *kaleBananaSmoothieRecipe = [[NATRecipe alloc]initWithIngredients:@[@"kale", @"banana"] recipeImage:[UIImage imageNamed:@"kale-banana-smoothie"] label:@"Kale Banana Smoothie"];
    NATRecipe *kaleSaladWithBloodOrangesRecipe = [[NATRecipe alloc]initWithIngredients:@[@"kale",@"blood oranges"] recipeImage:[UIImage imageNamed:@"kale-salad-with-blood-oranges"] label:@"Kale Salad with Blood Oranges"];

    self.breakfastPictureArray = @[auntyPsKaleSalad, avocadoBreakfastPudding, avocadoBreakfastSalad, avocadoKaleSalad, eggBakedInAvocado, kaleBananaSmoothie, kaleSaladWithBloodOranges, tomatoAvocadoToast];
    
    self.breakfastRecipeArray = @[auntyPsKaleSaladRecipe, avocadoBreakfastPuddingRecipe, avocadoBreakfastSaladRecipe, avocadoKaleSaladRecipe, eggBakedInAvocadoRecipe, kaleBananaSmoothieRecipe, kaleSaladWithBloodOrangesRecipe];
    
    NSLog(@" %@", [self.breakfastRecipeArray[0]recipeImage]);
    
    
    
    
    
   
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    NATCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"recipeCell" forIndexPath:indexPath];
    cell.RecipeCellImageView.image = [self.breakfastRecipeArray valueForKey:@"recipeImage" ][indexPath.row ];
    
    NSLog(@"%@", [self.breakfastRecipeArray valueForKey:@"label"]);
    
   
    
    cell.label.text = [self.breakfastRecipeArray valueForKey:@"label"][indexPath.row];
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
        destinationViewController.recipeLabeltext = [[self.breakfastRecipeArray valueForKey:@"label"]objectAtIndex:indexPath.row];
        destinationViewController.recipeImageImage = [[self.breakfastRecipeArray valueForKey:@"recipeImage"]objectAtIndex:indexPath.row];
        
    }
//    NSIndexPath *indexPathForLabel = [self.collectionView valueForKey:@"label"][inde];
    
    
    
    

}
@end
