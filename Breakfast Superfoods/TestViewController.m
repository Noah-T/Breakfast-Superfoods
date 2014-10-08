//
//  TestViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 10/6/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "TestViewController.h"
#import "NATUserDefaultInfo.h"
#import "NATRecipe.h"

@interface TestViewController ()

@property (strong, nonatomic) NSMutableArray *mutableRecipeArray;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (NSData *data in [[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]) {
        NATRecipe *recipe = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [self.mutableRecipeArray addObject:recipe];
    }
    NSLog(@"array: %@", self.mutableRecipeArray);
    NATRecipe *firstRecipe = self.mutableRecipeArray[0] ;
    UIImage *firstRecipeImage = firstRecipe.recipeImage;
    self.TestImageview.image = firstRecipeImage;
    NSLog(@"firstRecipeImage has a value of %@ and a class of %@", firstRecipeImage, [firstRecipeImage class]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
