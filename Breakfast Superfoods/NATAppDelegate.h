//
//  NATAppDelegate.h
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/10/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NATAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIButton *theButton;
@property (strong, nonatomic) UILabel *theLabel;
@property (strong, nonatomic) UIView *breakfastImage;
@property (strong, nonatomic) UIView *breakfastImage2;
@property (strong, nonatomic) UIView *breakfastImage3;
@property (strong, nonatomic) NSArray *kalePictureArray;
@property (strong, nonatomic) UIImageView *breakfastImageView;
@property (strong, nonatomic) UIImageView *breakfastImageView2;
@property (nonatomic) CGRect mainWindowFrame;

@end
