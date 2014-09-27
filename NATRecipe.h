//
//  NATRecipe.h
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/19/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NATRecipe : NSObject
<NSCoding>

@property (strong, nonatomic)NSArray *ingredients;
@property (strong, nonatomic)UIImage *recipeImage;
@property (strong, nonatomic)NSString *label;

- (instancetype)initWithIngredients:(NSArray *)ingredients recipeImage:(UIImage *)recipeImage label:(NSString *)label;

@end
