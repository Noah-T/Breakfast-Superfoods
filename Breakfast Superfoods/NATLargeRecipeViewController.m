//
//  NATLargeRecipeViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/19/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATLargeRecipeViewController.h"
#import <Social/Social.h>

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
    self.recipeLabel.text = self.recipeLabeltext;
    self.recipeImage.image = self.recipeImageImage;
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [twitterViewController setInitialText:self.recipeLabeltext];
        [self presentViewController:twitterViewController animated:YES completion:nil];
    }
}

- (IBAction)postToFacebook:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        SLComposeViewController *facebookViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookViewController setInitialText:self.recipeLabeltext];
        [self presentViewController:facebookViewController animated:YES completion:nil];
    }
}

- (IBAction)sendEmail:(id)sender {
    NSString *emailTitle = @"Test email";
    NSString *messageBody = @"Message body";
    NSArray *toRecepients = @[@"nteshu@gmail.com"];
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc]init];
    mailViewController.mailComposeDelegate = self;
    [mailViewController setSubject:@"Yummy Recipe!"];
    [mailViewController setMessageBody:@"Here's a yummy recipe!" isHTML:YES];
    [mailViewController setToRecipients:toRecepients];
    
    [self presentViewController:mailViewController animated:YES completion:nil];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            
            //need to add a confirmation message here
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
