//
//  NATRecipeCollectionViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/18/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATRecipeCollectionViewController.h"
#import "NATCollectionViewCell.h"
#import "NATRecipe.h"
#import "NATLargeRecipeViewController.h"
#import "NATUserDefaultInfo.h"

static NSString *const kNATRecipeCellIdentifier = @"kNATRecipeCellIdentifier";

@interface NATRecipeCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>


@property (strong, nonatomic) NSArray *breakfastRecipeArray;
@property (strong, nonatomic) NSArray *filteredBreakfastRecipeArray;
@property (strong, nonatomic) NSString *currentFilterString;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation NATRecipeCollectionViewController

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
        
    
    //avocado
    NATRecipe *avocadoToast = [[NATRecipe alloc]initWithIngredients:@[@"bread", @"avocado", @"lime", @"red pepper flakes", @"grape tomatoes", @"olive oil", @"salt", @"ground pepper"] recipeImage:[UIImage imageNamed:@"avocadoRecipe1"] label:@"Avocado Toast" recipePreparation:@"2 slices of multi-grain bread\n"
                               "1 avocado cut in half\n"
                               "1 lime, cut in half\n"
                               "crushed red pepper flakes\n"
                               "6 Grape tomatoes cut into small rounds.\n"
                               "olive oil\nkosher salt\nfreshly ground pepper\n\n"
                               "Toast the bread (butter if you like) and mash one half of the avocado on each slice of bread with a fork. Squeeze one half of the lime on each slice, top each half with the sliced tomatoes, add a pinch of red pepper flakes, salt & pepper to taste and a drizzle of olive oil." ];
    NATRecipe *eggInAvocado = [[NATRecipe alloc]initWithIngredients:@[@"avocado", @"eggs"]  recipeImage:[UIImage imageNamed:@"avocadoRecipe2"] label:@"Egg in Avocado"recipePreparation:@"Ingredients:\n"
                               "Avocado\n"
                               "Egg\n\n"
                               "Basically, you remove the pit from a halved avocado, hollow out a little more space if needed, and crack an egg into the hollow. The avocado becomes an edible ramekin, holding the egg as it bakes. Additions like cheese or herbs can be sprinkled over the top before baking."];
    NATRecipe *avocadoBreakfastPudding = [[NATRecipe alloc]initWithIngredients:@[@"avocado", @"milk", @"honey", @"granola", @"almonds"] recipeImage:[UIImage imageNamed:@"avocadoRecipe3"] label:@"Avocado Breakfast Pudding" recipePreparation:@"serves 1 or 2\n"
                                          "1 ripe avocado\n"
                                          "1/2 cup milk\n"
                                          "1 tablespoon honey\n"
                                          "2 to 3 tablespoons granola or crushed almonds\n\n"
                                          "Blend avocado, milk, and honey in a blender (or food processor) until smooth. Garnish with granola or almonds. You can also chill for about an hour for a refreshing coolness."];
    NATRecipe *blackBeanEggAndAvocadoWrap = [[NATRecipe alloc]initWithIngredients:@[@"wheat tortilla", @"black beans",@"egg", @"avocado", @"cheddar cheese", @"salsa", @"barbecue sauce"] recipeImage:[UIImage imageNamed:@"avocadoRecipe4"] label:@"Black Bean, Egg, and Avocado Wrap" recipePreparation:@"Serves 1\n"
                                             "1 whole wheat tortilla (or 2 small)\n"
                                             "1/2 cup canned black beans, drained and rinsed\n"
                                             "1 egg\n"
                                             "1 ripe avocado, sliced\n"
                                             "Handful of shredded cheddar cheese\n"
                                             "Salsa or bbq sauce for topping\n\n"
                                             
                                             "Heat tortilla(s) by covering with a damp paper towel and microwaving on high for 30 seconds.  Heat black beans in a small saucepan until warm.  Transfer to center of tortilla(s).  Whisk egg then cook in a small pan over medium-low heat, stirring often, until scrambled.  Transfer to tortilla, on top of black beans.  Top with shredded cheese, sliced avocado, and salsa or barbeque sauce.  Wrap and eat warm.\n\n"
                                             
                                             "Note that all amounts are approximate and can be adjusted to your liking.  You could easily make this serve two people by doubling or tripling the amount of eggs."];
    NATRecipe *smokedSalmonAvocadoToast = [[NATRecipe alloc]initWithIngredients:@[@"bread", @"avocado", @"lemond", @"salmon"]recipeImage:[UIImage imageNamed:@"avocadoRecipe5"] label:@"Smoked Salmond Avocado Toast" recipePreparation:@"2 slices hearty whole-grain bread\n"
                                           "1/2 ripe avocado\n"
                                           "juice of 1/2 lemon\n"
                                           "2 ounces smoked salmon\n"
                                           "Toast bread until golden brown. While the bread is in the toaster, mash the avocado with the lemon juice. Spread the avocado mixture on the toast and top with the smoked salmon."];


    
    //berries
    NATRecipe *berryBreakfastQuinoa = [[NATRecipe alloc]initWithIngredients:@[@"milk", @"yogurt", @"chia", @"quinoa", @"fruit", @"berries", @"almonds", @"cinnamon"] recipeImage:[UIImage imageNamed:@"berryrecipe1"] label:@"Berry Breakfast Quinoa" recipePreparation:@"1/4 cup milk\n2 containers (6 oz each) Yoplait® Original 99% Fat Free French vanilla, strawberry or harvest peach yogurt\n"
                                       "4 teaspoons chia seed\n1 cup cooled cooked quinoa (1/4 cup uncooked)\n"
                                       "2 cups fresh fruit (mixed berries or chopped peaches)\n1/4 cup coarsely chopped toasted almonds or pecans\n"
                                       "1/8 teaspoon ground cinnamon\n\n"
                                       "In medium bowl, stir together milk, yogurt and chia seed until blended. Evenly divide mixture among 4 glasses. Spoon 1/4 cup cooled cooked quinoa on top of yogurt layer on each.\n\n Top each with a layer of fruit and almonds. Sprinkle with cinnamon. Let stand 5 minutes, or cover and refrigerate overnight." ];
    NATRecipe *rawVeganBlueberryCoconutBreakfastShake = [[NATRecipe alloc]initWithIngredients:@[@"blueberries", @"coconut", @"dates", @"chia", @"spinach"] recipeImage:[UIImage imageNamed:@"berryrecipe2"] label:@"Raw Vegan Blueberry Coconut Breakfast Shake" recipePreparation:@"2 cups frozen or fresh blueberries\n"
                                                         "1 1/2 cups coconut water (or almond milk)\n"
                                                         "1/2 cup dried, shredded coconut (make sure you find an unsweetened, natural brand)\n"
                                                         "2 pitted dates (more if desired)\n"
                                                         "2 tablespoons chia seed\n"
                                                         "1 handful spinach or any other greens\n\n"
                                                         "Blend all ingredients together in a high speed blender. Serve!"];
    NATRecipe *rawRaspberryBreakfastBar = [[NATRecipe alloc]initWithIngredients:@[@"coconut", @"vanilla", @"cinnamon", @"salt", @"walnuts", @"dates", @"raspberries", @"chia", @"cacao"] recipeImage:[UIImage imageNamed:@"berryrecipe3"] label:@"Raw Raspberry Breakfast Bar" recipePreparation:
                                           @"Base Layer:\n"
                                           "1 cup dried coconut\n"
                                           "1 vanilla bean scraped, or 1/2 tsp vanilla\n"
                                           "1/2 tsp cinnamon\n"
                                           "pinch sea salt\n"
                                           "1 cup raw walnuts\n"
                                           "9 medjool dates, pitted (about 1 cup)\n"
                                           "Blend coconut, vanilla, cinnamon, & sea salt together in food processor for 30 to 60 seconds. Add in walnuts, blend. Then add in 9 pitted medjool dates. Press mixture into a wax/parchment lined pan. Set in fridge to firm up.\n\n"
                                           "Raspberry Layer:\n"
                                           "1.5 cups frozen raspberries, thawed, drained\n"
                                           "4 medjool dates, pitted\n"
                                           "2 TBS chia seeds\n"
                                           "Blend only raspberries and dates until dates are well combined. Pour into a bowl, and stir in chia seeds. Let set for 15 minutes, stirring on occasion. It will thicken into a nice raspberry “jam”. If not thick enough after 15 minutes, stir in a little more chia until you have the right consistency. Spread over base layer.\n\n"
                                           "Topping:\n"
                                           "1/3 cup dried coconut\n"
                                           "1/3 cup raw walnuts\n"
                                           "pinch cinnamon\n"
                                           "pinch sea salt\n"
                                           "Pulse topping ingredients together until a nice crumble is formed. Sprinkle over raspberry layer Garnish with cacao nibs, set in fridge to firm up.\n\n"
                                           "Garnish:\n"
                                           "2 TBS raw cacao nibs\n"
                                           "You have just created the perfect blissful breakfast bar. Makes 8 medium sized bars! Or 6 large ones."];
    NATRecipe *breakfastBerrySmoothieWithCacaoDrizzleAndChia = [[NATRecipe alloc]initWithIngredients:@[@"walnut milk", @"chia", @"banana", @"mango", @"strawberries", @"cacao", @"maple syrup", @"water"] recipeImage:[UIImage imageNamed:@"berryrecipe4"] label:@"Breakfast Berry Smoothie with Cacao Drizzle and Chia Pudding" recipePreparation:@"Chia Pudding\n"
                                                                "1/4 cup walnut milk\n"
                                                                "1 tablespoon chia seeds\n\n"
                                                                "Smoothie\n"
                                                                "1 1/2 cups walnut milk\n"
                                                                "1 banana\n"
                                                                "1 cup frozen mango\n"
                                                                "1/4 cup strawberries\n\n"
                                                                "Cacao Drizzle\n"
                                                                "1 tablespoon cacao powder\n"
                                                                "1 teaspoon maple syrup\n"
                                                                "Water, if needed\n\n"
                                                                "Instructions\n"
                                                                "1. To make the chia pudding: stir together the chia seeds and walnut milk, then let it sit for 10 minutes. The chia seeds will double in size and soak up the milk so it becomes like rice pudding!\n"
                                                                "2. To make the smoothie: blend everything until smooth.\n"
                                                                "3. To make the cacao drizzle: stir together the ingredients until combined. If it's not drizzly enough, add a tiny bit of water. Layer the pudding, smoothie and cacao drizzle as desired in a glass, then enjoy! I put the chia pudding in the bottom of the glass, drizzled the chocolate sauce inside the glass, then poured in the smoothie.\n"];
    NATRecipe *ultimateBlueberryAndBananaBreakfastSmoothie = [[NATRecipe alloc]initWithIngredients:@[@"banana", @"blueberries", @"water", @"chia", @"flax", @"oats", @"almond butter", @"dates"] recipeImage:[UIImage imageNamed:@"berryrecipe5"] label:@"Ultimate Blueberry and Banana Breakfast Smoothie" recipePreparation:@"Makes one glass:\n"
                                                              "- 1 ripe banana\n"
                                                              "- 1/2 a cup of blueberries\n"
                                                              "- 1/2 a cup of ice cold water\n"
                                                              "- 1 tablespoon of chia seeds\n"
                                                              "- 1 tablespoon of flax seeds\n"
                                                              "- 1 tablespoon of oats\n"
                                                              "- 1 tablespoon of almond butter\n"
                                                              "- 2 medjool dates\n\n"
                                                              
                                                              "Simply pit the dates then place all of the ingredients together in the blender and blend until smooth, this should just take a minute or two. If you like it a little runnier, add some extra water at the end.\n"
                                                              "Sip and enjoy!\n"];
    
    //eggs
    NATRecipe *eggsWithSpinachAndCremeFraiche = [[NATRecipe alloc]initWithIngredients:@[@"butter", @"shallots", @"spinach", @"eggs", @"creme fraiche", @"sour cream", @"lemon juice", @"cayenne pepper", @"bread", @"toast"] recipeImage:[UIImage imageNamed:@"eggRecipe1"] label:@"Eggs with Spinach and Creme Fraiche" recipePreparation:@"INGREDIENTS\n"
                                                 "3 tablespoons unsalted butter\n"
                                                 "1 medium shallot, minced\n"
                                                 "1 1/2 pounds spinach (about 2 medium bunches), washed and thoroughly dried\n"
                                                 "6 large eggs\n"
                                                 "4 ounces crème fraîche or sour cream\n"
                                                 "1 1/2 teaspoons freshly squeezed lemon juice\n"
                                                 "1/8 teaspoon ground cayenne pepper\n"
                                                 "6 pieces toast\n\n"
                                                 
                                                 "INSTRUCTIONS\n"
                                                 "Melt butter in a 12-inch frying pan over medium heat. Once butter foams, add shallot and cook, stirring occasionally, until softened, about 5 minutes.\n\n"
                                                 "Add spinach, season well with salt and freshly ground black pepper, and cook until just wilted, about 3 minutes. Make six indentations in spinach, crack an egg into each, cover the pan, and cook eggs to desired doneness. Meanwhile, combine crème fraîche or sour cream, lemon juice, and cayenne in a small bowl.\n\n"
                                                 "To serve, divide spinach and eggs among pieces of toast, place a dollop of cream mixture over each egg, and season with freshly ground black pepper."];
    
    NATRecipe *poachedEggsWithRoastedTomatoes = [[NATRecipe alloc]initWithIngredients:@[@"cherry tomatoes", @"olive oil", @"salt", @"black pepper", @"thyme leaves", @"eggs", @"whole wheat english muffin"] recipeImage:[UIImage imageNamed:@"eggRecipe2"] label:@"Poached Eggs with Roasted Tomatoes" recipePreparation:@"Ingredients\n"
                                                 "1 pint cherry tomatoes (10 ounces)\n"
                                                 "1 tablespoon extra-virgin olive oil\n"
                                                 "Kosher salt and freshly ground black pepper\n"
                                                 "1 tablespoon fresh thyme leaves, plus more for garnish\n"
                                                 "2 large eggs\n"
                                                 "1 whole-wheat English muffin, split and toasted\n\n"
                                                 "Directions\n"
                                                 "Heat oven to 425 degrees. Arrange tomatoes in a baking dish. Drizzle with oil and season with salt and pepper. Toss with thyme. Roast until tomatoes begin to burst, about 20 minutes. Scrape tomatoes and any juices into a bowl and let cool slightly.\n"
                                                 "In a medium straight-sided skillet, heat 2 inches of water over medium until bubbles cover bottom and sides of pan. Crack each egg into a separate small bowl. Gently pour eggs into pan, leaving room between them. Cook eggs, undisturbed, until white is just set and yolk is still loose, 4 to 5 minutes. Use a rubber spatula to gently release eggs from bottom of pan, if necessary. Using a slotted spoon, remove eggs from water. Blot bottom of spoon on a paper towel to remove excess water before serving.\n"
                                                 "Serve eggs over English muffin halves. Season with salt and pepper. Top with roasted tomatoes.\n"];
    
    NATRecipe *watercressWithGarlicAndScrambledEggs = [[NATRecipe alloc]initWithIngredients:@[@"olive oil", @"garlic", @"watercress", @"eggs", @"salt", @"black pepper"] recipeImage:[UIImage imageNamed:@"eggRecipe3"] label:@"Watercress with Garlic and Scrambled Eggs" recipePreparation:@"Ingredients/n"
                                                       "1 teaspoon extra-virgin olive oil\n"
                                                       "1 clove garlic, minced\n"
                                                       "1 cup watercress, stems removed\n"
                                                       "2 large eggs\n"
                                                       "Coarse salt and freshly ground black pepper\n\n"
                                                       "Directions\n"
                                                       "Heat oil in a small skillet over medium heat. Add garlic and cook until fragrant, about 1 minute. Add watercress and cook, stirring, until just wilted. Remove from pan and set aside. Lower heat to medium-low.\n\n"
                                                       "Whisk eggs and season with salt and pepper. Pour eggs into pan and cook, stirring, until just set. Return watercress to pan and stir. Serve immediately."];
    NATRecipe *hardBoiledEggsWithAvocado = [[NATRecipe alloc]initWithIngredients:@[@"eggs", @"avocado", @"salt", @"ground pepper", @"olive oil"] recipeImage:[UIImage imageNamed:@"eggRecipe4"] label:@"Hard-Boiled Eggs with Avocado" recipePreparation:@"INGREDIENTS\n"
                                            
                                            "8 large eggs\n"
                                            "2 avocados, preferably Hass\n"
                                            "1/4 teaspoon coarse salt\n"
                                            "Freshly ground pepper\n"
                                            "1 tablespoon extra-virgin olive oil\n\n"\
                                            
                                        
                                            "DIRECTIONS\n"
                                            "1.	Cover eggs with cold water in a large saucepan; bring to a boil. Remove pan from heat. Let eggs stand, covered, 8 minutes; transfer with a slotted spoon to an ice-water bath, and let cool. Peel eggs. Separate yolks from whites (reserve yolks for another use).Tear whites into 1-inch pieces; divide among four bowls\n"
                                            "2.	Halve and pit the avocados. Using a spoon, scrape out pieces; divide among bowls with egg whites. Divide salt among servings, and season with pepper. Drizzle each serving with 3/4 teaspoon oil.\n"];
    
    NATRecipe *avocadosYHuevosCaliente = [[NATRecipe alloc]initWithIngredients:@[@"cumin", @"olive oil", @"onion", @"jalapeno", @"tomatoes", @"garlic", @"salt", @"avocado", @"eggs", @"cilantro", @"corn tortillas", @"lime"] recipeImage:[UIImage imageNamed:@"eggRecipe5"] label:@"Avocados y Huevoes Caliente" recipePreparation:@"Serves 2\n"
                                          "1 teaspoon cumin seed\n"
                                          "2 teaspoons olive oil\n"
                                          "1/2 large onion, chopped\n"
                                          "1 jalapeño, sliced (save 2-4 slices for garnish)\n"
                                          "1 1/2 cups diced tomatoes (canned or fresh)\n"
                                          "1 clove garlic, sliced very thin\n"
                                          "Kosher salt\n"
                                          "1 large avocado\n"
                                          "2 eggs\n"
                                          "2 tablespoons chopped cilantro\n"
                                          "Warm corn tortillas (optional)\n"
                                          "Lime wedges\n\n"
                                          "1.	Pre-heat oven to 425°.\n"
                                          "2.	Heat medium oven safe skillet over medium heat. Toast cumin in pan until fragrant. Add olive oil to pan. Sauté onion and jalapeno in hot olive oil until vegetables begin to soften. Add tomatoes, garlic, and 1/2 teaspoon salt; simmer about 5 minutes to let flavors combine and liquid reduce slightly. If tomatoes aren’t very juicy you may need to add a tablespoon or 2 of water.\n"
                                          "3.	While the vegetables simmer cut avocado in half, remove pit and peel. If needed, scoop out a little more avocado to make room for one egg in each half.\n"
                                          "4.	Take the simmering salsa off the heat; add salt to taste. Make 2 small wells in the salsa and nestle in the avocado cut side up. Crack one egg into each avocado half. Sprinkle eggs with a small pinch of salt. Bake in the oven until the egg is done to your liking. 15 minutes yields cooked whites and a yolk that is slightly runny in the middle.\n"
                                          "5.	Garnish with cilantro, jalapeño and lime wedges. Serve with warm corn tortillas if desired.\n"];

    self.breakfastRecipeArray = @[avocadoToast, eggInAvocado, avocadoBreakfastPudding, blackBeanEggAndAvocadoWrap, smokedSalmonAvocadoToast, berryBreakfastQuinoa, rawVeganBlueberryCoconutBreakfastShake, rawRaspberryBreakfastBar, breakfastBerrySmoothieWithCacaoDrizzleAndChia, ultimateBlueberryAndBananaBreakfastSmoothie, eggsWithSpinachAndCremeFraiche, poachedEggsWithRoastedTomatoes, watercressWithGarlicAndScrambledEggs, hardBoiledEggsWithAvocado, avocadosYHuevosCaliente];
    
    self.filteredBreakfastRecipeArray = self.breakfastRecipeArray;
    

    
    
    
    
    
   
    
    [self.collectionView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.isMovingFromParentViewController) {
        NSLog(@"back is being pressed");
            }
}

-(void)setCurrentFilterString:(NSString *)currentFilterString
{

    if ([currentFilterString isEqualToString:_currentFilterString ]) {
        return;
    }
    
    _currentFilterString = currentFilterString;

    if (currentFilterString.length < 1) {
        self.filteredBreakfastRecipeArray = self.breakfastRecipeArray;
    
    } else {
        NSMutableArray *newFilteredArray = [NSMutableArray array];
        
        [self.breakfastRecipeArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NATRecipe *recipe = obj;
            for (NSString *ingredient in recipe.ingredients) {
                
                //note: was previously using containsString, but this only works in iOS8 (will crash in iOS 7 and below)
                if([ingredient rangeOfString:currentFilterString options:NSCaseInsensitiveSearch].location != NSNotFound){

                    [newFilteredArray addObject:recipe];

                    return ;
                }
            }
        }];
        
        self.filteredBreakfastRecipeArray = [NSArray arrayWithArray:newFilteredArray];

    }
        [self.collectionView reloadData];
}

#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.filteredBreakfastRecipeArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NATCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kNATRecipeCellIdentifier forIndexPath:indexPath];
    
    NATRecipe *recipe = self.filteredBreakfastRecipeArray[indexPath.row];
    cell.RecipeCellImageView.image = recipe.recipeImage;
    cell.label.text = recipe.label;
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier  isEqualToString:@"LargeRecipeView"]) {
        NSLog(@"button pressed");
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        NATLargeRecipeViewController *destinationViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0]; //the first selected item
        
        NATRecipe *recipe = self.filteredBreakfastRecipeArray[indexPath.row] ;
        destinationViewController.recipe = recipe;
        destinationViewController.recipeLabeltext = recipe.label;
        destinationViewController.recipeImageImage = recipe.recipeImage;
    }

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length > 2) {
        self.currentFilterString = [searchText lowercaseString];
            } else {
        self.currentFilterString = nil;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
@end
