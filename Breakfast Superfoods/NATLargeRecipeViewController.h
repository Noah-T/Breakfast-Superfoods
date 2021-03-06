//
//  NATLargeRecipeViewController.h
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/19/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@class NATRecipe;


@interface NATLargeRecipeViewController : UIViewController <MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeLabeltext;
@property (nonatomic, strong) IBOutlet UIImageView *recipeImage;
@property (nonatomic, strong) UIImage *recipeImageImage;
@property (nonatomic, strong) NATRecipe *recipe;
@property (strong, nonatomic) NATRecipe *featuredRecipe;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;


@property (weak, nonatomic) IBOutlet UITextView *recipePreparationField;


- (IBAction)postToTwitter:(id)sender;
- (IBAction)postToFacebook:(id)sender;
- (IBAction)sendEmail:(id)sender;

-(void)saveButtonPressed;
- (BOOL) doesRecipeAlreadyExist:(NATRecipe *)recipe;

@end
