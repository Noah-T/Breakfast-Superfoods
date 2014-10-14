//
//  NATFavoritesLargeRecipeViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 10/14/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATFavoritesLargeRecipeViewController.h"
#import "NATUserDefaultInfo.h"

@interface NATFavoritesLargeRecipeViewController ()

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeLabeltext;
@property (nonatomic, strong) IBOutlet UIImageView *recipeImage;
@property (nonatomic, strong) UIImage *recipeImageImage;
@property (nonatomic, strong) NATRecipe *recipe;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;


- (IBAction)postToFacebook:(id)sender;
- (IBAction)postToTwitter:(id)sender;
- (IBAction)sendEmail:(id)sender;

@end

@implementation NATFavoritesLargeRecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)postToFacebook:(id)sender {
    [super postToFacebook:sender];
    
}

- (IBAction)postToTwitter:(id)sender {
    [super postToTwitter:sender];
}

- (IBAction)sendEmail:(id)sender {
    [super sendEmail:sender];
}

-(void)saveButtonPressed{
    [super saveButtonPressed];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSLog(@"There are %d objects in user defaults", [[[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]count]);
}



@end
