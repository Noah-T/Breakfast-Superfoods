//
//  NATHomeViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 10/14/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATHomeViewController.h"
#import "NATRecipe.h"
#import "NATUserDefaultInfo.h"

@interface NATHomeViewController ()

@property (strong, nonatomic)NSMutableArray *breakfastRecipeArray;


- (IBAction)favoriteButtonPressed:(id)sender;

@end

@implementation NATHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.breakfastRecipeArray = [NSMutableArray array];
    for (NSData *data in [[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]) {
        NATRecipe *recipe = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if (recipe) {
            [self.breakfastRecipeArray addObject:recipe];
        } else {
            return;
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)favoriteButtonPressed:(id)sender {
    if (self.breakfastRecipeArray.count > 0) {
        [self performSegueWithIdentifier:@"favoritesExist" sender:self];
        NSLog(@"favorites exist");
    } else {
        [self performSegueWithIdentifier:@"favoritesDoNotExist" sender:self];
        NSLog(@"favorites don't exist");

    }
    
}
@end
