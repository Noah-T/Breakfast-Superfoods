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

@interface NATRecipeCollectionViewController ()

@property (strong, nonatomic) NSArray *breakfastPictureArray;
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
    
    NATRecipe *auntyPsKaleSaladRecipeTile = [[NATRecipe alloc]initWithIngredients:@[@"kale"] recipeImage:auntyPsKaleSalad label:@"Aunty P's Kale Salad"];
    NATRecipe *avocadoBreakfastPuddingRecipeTile = [[NATRecipe alloc]initWithIngredients:@[@"avocado"] recipeImage:avocadoBreakfastPudding label:@"Avocado Breakfast Pudding"];

    self.breakfastPictureArray = @[auntyPsKaleSalad, avocadoBreakfastPudding, avocadoBreakfastSalad, avocadoKaleSalad, eggBakedInAvocado, kaleBananaSmoothie, kaleSaladWithBloodOranges, tomatoAvocadoToast];
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
    return self.breakfastPictureArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NATCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"recipeCell" forIndexPath:indexPath];
    cell.RecipeCellImageView.image = self.breakfastPictureArray[indexPath.row];
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
