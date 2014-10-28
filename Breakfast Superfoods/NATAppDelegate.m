//
//  NATAppDelegate.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/10/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATAppDelegate.h"



@implementation NATAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
 /*   self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    NATRecipeTableViewController *mainViewController = [[NATRecipeTableViewController alloc]init];
    self.window.rootViewController = mainViewController;
    
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    NSLog(@"root view controller has a value of %@", self.window.rootViewController);*/
    UINavigationBar *navigationAppearance = [UINavigationBar appearance];
    [navigationAppearance setBarTintColor:[UIColor colorWithRed:1 green:1 blue:0.341 alpha:0.7] /*#ffff57*/
];
   

    return YES;
   
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//-(void)changeBreakfastImage:(id)sender
//{
//    
//    
//    
//    
//    
//    //once I figure out how to change it, this is the approach I had in mind for randomizing:
//  int randomArrayIndex = arc4random() % [self.kalePictureArray count]; //arc4random is NOT inclusive!!!
//    if(self.breakfastImageView.image == self.kalePictureArray[randomArrayIndex]){
//        if(self.breakfastImageView.image == self.kalePictureArray[0]){
//            int increasedArrayIndex = randomArrayIndex +1;
//            [self.breakfastImageView setImage:self.kalePictureArray[increasedArrayIndex]];
//                    }
//        
//        else if(self.breakfastImageView.image == self.kalePictureArray[[self.kalePictureArray count]-1]){
//            int decreasedArrayIndex = randomArrayIndex -1;
//            [self.breakfastImageView setImage:self.kalePictureArray[decreasedArrayIndex]];
//        }
//        
//        else {
//            int upOrDownRandomizedArrayIndex = arc4random() % 2; //this means up to 2, not inclusive (0 or 1)
//            if(upOrDownRandomizedArrayIndex == 0){
//                int decreasedArrayIndex = randomArrayIndex -1;
//                [self.breakfastImageView setImage:self.kalePictureArray[decreasedArrayIndex]];
//            } else {
//                int increasedArrayIndex = randomArrayIndex +1;
//                [self.breakfastImageView setImage:self.kalePictureArray[increasedArrayIndex]];
//            }
//        }
//        
//        
//        
//        
//    } else {
//        [self.breakfastImageView setImage:self.kalePictureArray[randomArrayIndex]];
//
//    }
//    
//    
//
//    
//    
//    
//    
//}




@end
