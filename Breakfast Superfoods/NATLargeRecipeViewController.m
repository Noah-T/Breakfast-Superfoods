//
//  NATLargeRecipeViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/19/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATLargeRecipeViewController.h"
#import <Social/Social.h>
#import "NATUserDefaultInfo.h"
#import "NATRecipe.h"
@interface NATLargeRecipeViewController ()

@end

@implementation NATLargeRecipeViewController

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
    self.automaticallyAdjustsScrollViewInsets = NO;

    

    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"content inset is: %f", self.recipePreparationField.contentInset.top);
    NSLog(@"view will appear being called");
    [self.navigationController setNavigationBarHidden:NO];
    
    if ([self doesRecipeAlreadyExist:self.recipe]) {
        [self.saveButton setTitle:@"Remove" forState:UIControlStateNormal];
        NSLog(@"yes, it exists");
    } else {
        [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    }
    
    self.recipeLabel.text = self.recipeLabeltext;
    self.recipeImage.image = self.recipeImageImage;
    self.recipePreparationField.text = self.recipe.recipePreparation;

    
    [self.saveButton addTarget:self action:@selector(saveButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.recipePreparationField.contentOffset = CGPointMake(0,0);

}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.recipePreparationField.contentOffset = CGPointMake(0,0);

    NSLog(@"Yo");

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)postToTwitter:(id)sender {
    NSLog(@"twitter button pressed");
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        SLComposeViewController *twitterViewController =[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [twitterViewController setInitialText:[NSString stringWithFormat:@"Yum! Great recipe for %@ from Breakfast Superfoods [link to app]", self.recipeLabeltext]];
        [self presentViewController:twitterViewController animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Twitter account not found. Log in by going to settings, and then Twitter."  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
}

- (IBAction)postToFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        SLComposeViewController *facebookViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookViewController setInitialText:[NSString stringWithFormat:@"Yum! Great recipe for %@ from Breakfast Superfoods [link to app]", self.recipeLabeltext]];
        [self presentViewController:facebookViewController animated:YES completion:nil];
    }else {
        NSLog(@"Facebook account not found");
        //need to flesh this out
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Facebook account not found. Log in by going to settings, and then Facebook."  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    
}

- (IBAction)sendEmail:(id)sender {
    NSArray *toRecepients = @[@""];
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc]init];
    mailViewController.mailComposeDelegate = self;
    [mailViewController setSubject:self.recipeLabeltext];
    [mailViewController setMessageBody:[NSString stringWithFormat:@"%@ \n\n %@",self.recipe.label, self.recipe.recipePreparation] isHTML:NO];
    [mailViewController setToRecipients:toRecepients];
    
    [self presentViewController:mailViewController animated:YES completion:nil];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
            NSLog(@"Mail cancelled");
            break;
        }
        case MFMailComposeResultSaved:
        {
            NSLog(@"Mail saved");
            break;
        }
        case MFMailComposeResultSent:
        {
            NSLog(@"Mail sent");
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"Email sent."  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
            //need to add a confirmation message here
            break;
        }
        case MFMailComposeResultFailed:
        {
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"The email failed to send. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
            break;
        }
            
            default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)saveButtonPressed
{   //create a singleton storage space to save favorite recipes
    //create a pointer called favoritesArray, point it at anything in the storage space that has the key "kKeyToFavoritesArray"
    NSArray *favoritesArray = [[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray];
    //if the favoritesArray doesn't exist, create it
    if (!favoritesArray) {
        favoritesArray = [NSArray array];
    }
    
    //NSKeyedArchiver tells it to store it as NSData format
    //NSKeyedUnarchiver will retrieve it as NSData format
    
    NSData *alreadyExistsData = nil;
    for (NSData *data in favoritesArray) {
        NATRecipe *recipe = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        NSLog(@"%@",recipe);
        if ([recipe.label isEqualToString:self.recipe.label]) {
            NSLog(@"Already exists");
            alreadyExistsData = data;
            break;
        }
    }
    
    NSMutableArray *mutableFavoritesArray = [favoritesArray mutableCopy];
    
    if (!alreadyExistsData) {
        
        //add the recipe to the mutable favorites array, convert it to special data type using NSKeyedArchiver
        [mutableFavoritesArray addObject:[NSKeyedArchiver archivedDataWithRootObject:self.recipe]];
        
        [self.saveButton setTitle:@"Remove" forState:UIControlStateNormal];
    } else {
        NSLog(@"Pre: %d",mutableFavoritesArray.count);
        [mutableFavoritesArray removeObject:alreadyExistsData];
        NSLog(@"Post: %d", mutableFavoritesArray.count);
        [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    }
    
    
    //assign the contents of the mutableFavoritesArray to the kKeyToFavoritesArray key
    [[NSUserDefaults standardUserDefaults]setObject:mutableFavoritesArray forKey:kKeyToFavoritesArray];
    //tells it to update, similar to reloadData
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults]setObject:mutableFavoritesArray forKey:kKeyToFavoritesArray];
    //tells it to update, similar to reloadData
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    //        NATRecipe *recipe = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //        NSLog(@"%@", recipe);
}


- (BOOL) doesRecipeAlreadyExist:(NATRecipe *)recipe
{
    BOOL exists = NO;
    for (NSData *data in [[NSUserDefaults standardUserDefaults] objectForKey:kKeyToFavoritesArray]) {
        NATRecipe *recipe = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        NSLog(@"%@",recipe);
        if ([recipe.label isEqualToString:self.recipe.label]) {
            NSLog(@"Already exists");
            exists = YES;
            break;
        }
    }
    return exists;
}
@end
