//
//  NATNoFavoritesViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 10/20/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATNoFavoritesViewController.h"
#import "NATUserDefaultInfo.h"

@interface NATNoFavoritesViewController ()

@end

@implementation NATNoFavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([[[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]count]==0) {
        NSLog(@"there are no items in favorites");
        
        
    } else {
        NSLog(@"there are items in favorites");
        [self.navigationController popToRootViewControllerAnimated:NO];
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

@end
