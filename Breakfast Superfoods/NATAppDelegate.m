//
//  NATAppDelegate.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/10/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATAppDelegate.h"

@interface NATAppDelegate ()


@end

@implementation NATAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.breakfastImage = [UIImage imageNamed:@"kale1.png"];
    self.breakfastImage2 = [UIImage imageNamed:@"Kale_raw.png"];
    self.breakfastImage3 = [UIImage imageNamed:@"kale-benefits-1.png"];
    self.kalePictureArray = @[self.breakfastImage, self.breakfastImage2, self.breakfastImage3];
    
    CGRect mainWindowFrame = [[UIScreen mainScreen] bounds];
    UIWindow *mainWindow = self.window = [[UIWindow alloc] initWithFrame:mainWindowFrame];

        // Override point for customization after application launch.
    self.window = mainWindow;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    CGRect buttonFrame = CGRectMake(0, 0, 210, 30);
    
    self.theButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    self.theButton.backgroundColor = [UIColor yellowColor];
    self.theButton.frame = buttonFrame;
    [self.theButton setCenter:CGPointMake(mainWindowFrame.size.width/2, 100)];
    
    [self.theButton setTitle:@"Show me something yummy" forState:UIControlStateNormal];
    
    CGRect breakfastImageFrame = CGRectMake(mainWindowFrame.size.width/2-100, mainWindowFrame.size.height/2-100, 200, 200);
    
    self.breakfastImageView = [[UIImageView alloc]initWithFrame:breakfastImageFrame];
    
    

    
    [self.breakfastImageView setCenter:CGPointMake(mainWindowFrame.size.width/2, 300)];
    self.breakfastImageView = [[UIImageView alloc]initWithFrame:breakfastImageFrame];
    self.breakfastImageView.backgroundColor = [UIColor whiteColor];
    [self.breakfastImageView setImage:nil];
    
    
    
    CGRect labelFrame = CGRectMake(400, 400, 150, 50);
    self.theLabel = [[UILabel alloc ]initWithFrame:labelFrame];
    self.theLabel.backgroundColor = [UIColor yellowColor];
    self.theLabel.text =@"this is a label";
    [self.theLabel setCenter:CGPointMake(mainWindowFrame.size.width/2, mainWindowFrame.size.height/2+150)];
    [self.theLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self.theButton addTarget:self action:@selector(changeBreakfastImage:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.window addSubview:self.theButton];
    [self.window addSubview:self.breakfastImageView];
    [self.window addSubview:self.theLabel];
    
    
    
    
    
    
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

-(void)changeBreakfastImage:(id)sender
{
    
    
    
    
    
    //once I figure out how to change it, this is the approach I had in mind for randomizing:
  int randomArrayIndex = arc4random() % [self.kalePictureArray count]; //arc4random is NOT inclusive!!!
    if(self.breakfastImageView.image == self.kalePictureArray[randomArrayIndex]){
        NSLog(@"image didn't change");
        if(self.breakfastImageView.image == self.kalePictureArray[0]){
            int increasedArrayIndex = randomArrayIndex +1;
            [self.breakfastImageView setImage:self.kalePictureArray[increasedArrayIndex]];
            NSLog(@"this was triggered, alteredArrayIndex %d", increasedArrayIndex );
        }
        
        else if(self.breakfastImageView.image == self.kalePictureArray[[self.kalePictureArray count]-1]){
            int decreasedArrayIndex = randomArrayIndex -1;
            [self.breakfastImageView setImage:self.kalePictureArray[decreasedArrayIndex]];
        }
        
        else {
            int upOrDownRandomizedArrayIndex = arc4random() % 2; //this means up to 2, not inclusive (0 or 1)
            if(upOrDownRandomizedArrayIndex == 0){
                int decreasedArrayIndex = randomArrayIndex -1;
                [self.breakfastImageView setImage:self.kalePictureArray[decreasedArrayIndex]];
            } else {
                int increasedArrayIndex = randomArrayIndex +1;
                [self.breakfastImageView setImage:self.kalePictureArray[increasedArrayIndex]];
            }
        }
        
        
        
        
    } else {
        [self.breakfastImageView setImage:self.kalePictureArray[randomArrayIndex]];

    }
    
    

    
    
    
    
}



@end
