//
//  NATFavoritesLargeRecipeViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 10/14/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATFavoritesLargeRecipeViewController.h"

@interface NATFavoritesLargeRecipeViewController ()
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
}

- (IBAction)sendEmail:(id)sender {
}
@end
