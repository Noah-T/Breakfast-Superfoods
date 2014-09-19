//
//  NATRecipe.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/19/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATRecipe.h"

@implementation NATRecipe

- (instancetype)initWithIngredients:(NSArray *)ingredients recipeImage:(UIImage *)recipeImage label:(NSString *)label
{
    self = [super init];
    
    _ingredients = ingredients;
    _recipeImage = recipeImage;
    _label = label;
    
    return self;
}

@end
