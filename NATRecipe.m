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


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.ingredients forKey:@"ingredients"];
    [aCoder encodeObject:UIImagePNGRepresentation(self.recipeImage) forKey:@"recipeImage"];
    [aCoder encodeObject:self.label forKey:@"label"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder // NS_DESIGNATED_INITIALIZER
{
    self = [super init];
    
    _ingredients = [aDecoder decodeObjectForKey:@"ingredients"];
    _recipeImage = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"recipeImage"]];
    _label = [aDecoder decodeObjectForKey:@"label"];
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"title: %@ \n ingredients: %@", self.label, self.ingredients];
}
@end
