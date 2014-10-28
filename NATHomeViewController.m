//
//  NATHomeViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 10/14/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATHomeViewController.h"
#import "NATRecipe.h"
#import "NATUserDefaultInfo.h"
#import "NATRecipeCollectionViewController.h"
#import "NATLargeRecipeViewController.h"

@interface NATHomeViewController ()
@property (strong, nonatomic) NSArray *breakfastRecipeArray;
@property (strong, nonatomic) NSMutableArray *mutableFavoritesBreakfastRecipeArray;
@property (strong, nonatomic) NATRecipe *featuredRecipe;

@property (weak, nonatomic) IBOutlet UIImageView *featuredRecipeImage;

@property (weak, nonatomic) IBOutlet UILabel *featuredRecipeLabel;



- (IBAction)favoriteButtonPressed:(id)sender;


@end

@implementation NATHomeViewController

- (void)viewDidLoad {
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
    NATRecipe *rawRaspberryBreakfastBar = [[NATRecipe alloc]initWithIngredients:@[@"coconut", @"vanilla", @"cinnamon", @"salt", @"walnuts", @"dates", @"raspberries", @"chia", @"cacao"] recipeImage:[UIImage imageNamed:@"berryrecipe3"] label:@"Raw Raspberry Breakfast Bar" recipePreparation:@"Base Layer:\n"
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
    
    NATRecipe *watercressWithGarlicAndScrambledEggs = [[NATRecipe alloc]initWithIngredients:@[@"olive oil", @"garlic", @"watercress", @"eggs", @"salt", @"black pepper"] recipeImage:[UIImage imageNamed:@"eggRecipe3"] label:@"Watercress with Garlic and Scrambled Eggs" recipePreparation:@"Ingredients\n"
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
    
    NATRecipe *kaleAvocadoSalad = [[NATRecipe alloc]initWithIngredients:@[@"kale", @"avocado", @"lemon"] recipeImage:[UIImage imageNamed:@"kaleRecipe1"] label:@"Kale Avocado Salad" recipePreparation:@"INGREDIENTS\n"
                                   "1 medium bunch kale (any type), stemmed and shredded\n"
                                   "1 avocado, pitted and flesh removed\n"
                                   "1 lemon, juiced\n\n"
                                   
                                   "DIRECTIONS\n"
                                   "1.	In mixing bowl add the kale, avocado and lemon juice. With your hands, press to soften the avocado until thoroughly mixed.\n"
                                   "2.	Add salt and pepper to taste.\n"
                                   "3.	Toss with other ingredients you'd like to add or enjoy as is.\n"];
    NATRecipe *auntyPsKaleSalad = [[NATRecipe alloc]initWithIngredients:@[@"kale", @"lemon", @"avocado", @"ginger", @"olive oil"] recipeImage:[UIImage imageNamed:@"kaleRecipe2"] label:@"Aunty P's Kale Salad" recipePreparation:@"Ingredients\n"
                                   "2 bunches organic kale (I used dino kale), any variety\n"
                                   "1 large organic lemon, peel and reserve the zest for another recipe\n"
                                   "1 large RIPE organic avocado, peel and pit\n"
                                   "2 TBSP grated organic mature ginger root, unpeeled\n"
                                   "optional:\n"
                                   "2 TBSP organic cold pressed olive oil\n"
                                   "fresh cracked pink salt and pepper to taste\n\n"
                                   "Instructions\n"
                                   "1) Wash, trim off the ends and small chop the kale (including the rib) and place in a large mixing bowl.\n"
                                   "2) Juice the lemon over the kale.\n"
                                   "3) Now add the grated ginger and avocado (and olive oil if you are using it).\n"
                                   "4) Use your hands to massage and mash this into the kale leaves. Work this until the total amount is 1/2 of the original amount in your bowl.\n"
                                   "5) Salt and pepper to taste if so desired.\n"
                                   "6) Allow the salad to rest for 15 minutes, serve and ENJOY!!\n"];
    NATRecipe *kaleSaladWithBloodOrangeAndMeyerLemon = [[NATRecipe alloc]initWithIngredients:@[@"black kale", @"blood oranges", @"lemon zest", @"shallots", @"olive oil", @"salt", @"black pepper"] recipeImage:[UIImage imageNamed:@"kaleRecipe3"] label:@"Kale Salad with Blood Orange and Meyer Lemon" recipePreparation:@"1 bunch black kale (about 1 pound)\n"
                                                        "4 small blood oranges, segmented, juice reserved (about 3 tablespoons juice)\n"
                                                        "Zest of 1 Meyer lemon (about two teaspoons)\n"
                                                        "1 large shallot, finely chopped (about 2 tablespoons)\n"
                                                        "1/4 cup extra-virgin olive oil\n"
                                                        "Kosher salt and freshly ground black pepper\n\n"
                                                        "Wash kale and pat off excess water. If the center stems are tender enough to eat, simply trim the bottom inch or two. If the center stems are thick or tough, cut or tear them out and discard or save for another dish. Slice leaves crosswise into 1/4-inch-wide ribbons.\n\n"
                                                        "In a large bowl, whisk together the blood orange juice, Meyer lemon zest, shallots, olive oil, 1/4 teaspoon salt, and a good crack of black pepper. Add the kale and, using your hands, massage the dressing into the leaves. Add the blood orange segments and toss to combine.\n\n"
                                                        "Let stand for 20 minutes. Taste and season with more salt and pepper, if desired.\n"];
    NATRecipe *garlickyKaleWithFriedEggsAndSalsa = [[NATRecipe alloc]initWithIngredients:@[@"olive oil", @"garlic", @"kale", @"salt", @"black pepper", @"eggs", @"pico de gallo", @"salsa"] recipeImage:[UIImage imageNamed:@"kaleRecipe4"] label:@"Garlicky Kale with Fried Eggs and Salsa" recipePreparation:@"Ingredients:\n"
                                                    "1 T + 1 t olive oil, divided\n"
                                                    "1-2 large garlic cloves, finely chopped\n"
                                                    "2 c (packed) chopped fresh kale\n"
                                                    "Salt & pepper\n"
                                                    "2-4 eggs\n"
                                                    "4-6 T pico de gallo or salsa fresca\n\n"
                                                    "Directions:\n"
                                                    "1. Heat 1 tablespoon of oil in a large skillet. Add the garlic and cook until fragrant and just golden brown. Add the kale, sprinkle with salt & pepper, and sautee for 1-2 minutes only, until the kale begins to soften. Remove from heat. The residual heat from the pan will continue to cook the kale without overdoing it.\n"
                                                    "2. In a separate pan, heat the rest of the oil and add the eggs. Fry until they’re done to your liking, then remove from heat.\n"
                                                    "3. Place a generous amount of garlicky kale on a plate. Top with the eggs, add as much salsa as you like, and enjoy!\n"];
    NATRecipe *kaleBerryAndAcaiPowerSmoothie = [[NATRecipe alloc]initWithIngredients:@[@"banana", @"blueberries", @"strawberries", @"kale", @"almond milk", @"water", @"flax seed", @"hemp powder", @"chia seeds", @"acai", @"cinnamon"] recipeImage:[UIImage imageNamed:@"kaleRecipe5"] label:@"Kale, Berry and Acai Power Smoothie" recipePreparation:@"Makes 1 large glass\n"
                                                "- 1 ripe banana\n"
                                                "-1/3 of a cup of blueberries\n"
                                                "-1/3 of a cup of strawberries\n"
                                                "- 1/2 a cup of kale leaves (remove the hard parts of the stalks)\n"
                                                "- 1/4 of a cup of almond milk or water\n"
                                                "- 1 tablespoon of ground flax seed\n"
                                                "- 1 tablespoon of hemp powder\n"
                                                "- 1 tablespoon of chia seeds\n"
                                                "- 1 tablespoon of acai\n"
                                                "- 1 teaspoon of cinnamon\n\n"
                                                "Simply place all the ingredients in a blender together, removing the banana form the peel first of course, then blend into a delicious mix. Depending how liquid you like your smoothie then you may want to add a little more water.\n"
                                                "If you’re craving a crunch then sprinkle some extra chia seeds, oats and some hemp seeds on the top."];
    //oatmeal
    NATRecipe *oatmealCasserole = [[NATRecipe alloc]initWithIngredients:@[@"oats", @"almonds", @"strawberries", @"brown sugar", @"salt", @"cinnamon", @"eggs", @"milk", @"butter"] recipeImage:[UIImage imageNamed:@"oatmealRecipe1"] label:@"Oatmeal Casserole" recipePreparation:@"Ingredients\n"
                                   "1 1/2 cups rolled oats\n"
                                   "1/2 cup sliced almonds\n"
                                   "20 ounces strawberries, hulled and quartered\n"
                                   "1/3 cup plus 3 tablespoons light brown sugar, plus more for serving\n"
                                   "1/4 teaspoon salt\n"
                                   "1/4 teaspoon cinnamon\n"
                                   "1 large egg\n"
                                   "1 3/4 cups milk\n"
                                   "2 tablespoons (1 ounce) unsalted butter, melted, plus extra for greasing dish\n\n"
                                   "Procedures\n"
                                   "1. Adjust oven rack to middle position and preheat oven to 350°F. Lightly grease shallow 2-quart baking dish. Scatter oats, almonds, and strawberries into baking dish.\n"
                                   "2. Whisk 1/3 cup plus 2 tablespoons brown sugar, salt, cinnamon, egg, milk, and melted butter in medium bowl until combined. Pour into baking dish. Using spoon, gently press oats into liquid to moisten evenly.\n"
                                   "3. Scatter remaining tablespoon brown sugar over top and bake until center is just set, about 30 minutes. Serve immediately, passing extra brown sugar at the table.\n"];
    NATRecipe *oatmealWithBananaAndWalnuts = [[NATRecipe alloc]initWithIngredients:@[@"oats", @"water", @"banana", @"walnuts", @"cinnamon"] recipeImage:[UIImage imageNamed:@"oatmealRecipe2"] label:@"Oatmeal with Banana and Walnuts" recipePreparation:@"Ingredients\n"
                                              "1/2 cup old-fashioned rolled oats\n"
                                              "1 cup water\n"
                                              "1 banana, sliced\n"
                                              "1 tablespoon chopped walnuts\n"
                                              "1 teaspoon ground cinnamon\n\n"
                                              "Preparation\n"
                                              "1. Combine oats and 1 cup water in a small microwave-safe bowl. Microwave on high 3 minutes.\n"
                                              "2. Top with banana slices, walnuts, and cinnamon.\n"];
    NATRecipe *savoryOatmealWithSoftCookedEgg = [[NATRecipe alloc]initWithIngredients:@[@"oats", @"salt", @"ground pepper", @"cooking spray", @"eggs", @"cheddar cheese", @"scallions"] recipeImage:[UIImage imageNamed:@"oatmealRecipe3"] label:@"Savory Oatmeal with Soft-Cooked Egg" recipePreparation:@"INGREDIENTS\n"
                                                 
                                                 "1/2 cup quick-cooking rolled oats\n"
                                                 "Coarse salt and ground pepper\n"
                                                 "Nonstick cooking spray\n"
                                                 "1 large egg\n"
                                                 "2 tablespoons shredded sharp cheddar\n"
                                                 "1 tablespoon thinly sliced scallion greens\n\n"
                                                 
                                                 
                                                 "DIRECTIONS\n"
                                                 "1.	In a small saucepan, bring 1 cup water to a boil. Add oats and pinch of salt; stir, reduce heat, and simmer until tender, about 5 minutes. Meanwhile, heat a small nonstick pan over medium. Coat lightly with cooking spray. Add egg and cook until white is set and yolk is still runny, about 3 minutes. Season egg to taste with salt and pepper. Serve oatmeal in a bowl topped with cheese, egg, and scallion greens."];
    
    NATRecipe *savoryOatsWithBrieAndCherryTomatoes = [[NATRecipe alloc]initWithIngredients:@[@"olive oil", @"shallots", @"cherry tomatoes", @"salt", @"oats", @"garlic", @"brie", @"basil", @"pine nuts"] recipeImage:[UIImage imageNamed:@"oatmealRecipe4"] label:@"Savory Oats with Brie and Cherry Tomatoes" recipePreparation:@"2 tsp. olive oil or butter\n"
                                                      "1 shallot, chopped\n"
                                                      "2 cups cherry tomatoes, halved\n"
                                                      "1/2 tsp. salt, optional\n"
                                                      "2 cups old-fashioned rolled oats\n"
                                                      "1 clove garlic, minced (1 tsp.)\n"
                                                      "1 1/2 oz. Brie, cut into small cubes\n"
                                                      "1/2 cup fresh basil leaves, torn\n"
                                                      "1 Tbs. toasted pine nuts\n\n"
                                                      "1. Heat oil in skillet over medium-high heat. Add shallot, tomatoes, and salt (if using). Cook 5 minutes, or until shallot has softened and tomatoes start releasing their juices. Add oats; cook 1 minute more.\n\n"
                                                      "2. Stir in garlic and 4 cups water, and bring to a boil. Reduce heat to medium-low, and simmer, uncovered, 10 minutes. Remove from heat, and dot with Brie. Sprinkle with basil and pine nuts.\n"];
    NATRecipe *oatmealWithSquashAndSpinach = [[NATRecipe alloc]initWithIngredients:@[@"oats", @"water", @"broth", @"butternut squash", @"spinach", @"rosemary", @"fried egg", @"salt", @"black pepper"] recipeImage:[UIImage imageNamed:@"oatmealRecipe5"] label:@"Oatmeal with Squash and Spinach" recipePreparation:@"Ingredients\n"
                                              "1/2 cup rolled oats\n"
                                              "1 cup water (or broth)\n"
                                              "1/4 cup cubed and roasted butternut squash or sweet potatoes\n"
                                              "1/4 cup chopped spinach\n"
                                              "1 teaspoon rosemary (or other spice of choice)\n"
                                              "1 fried egg (optional)\n"
                                              "salt and pepper, to taste\n\n"
                                              "Instructions\n"
                                              "1.	Boil water (or broth) with oats in a small saucepan, stirring occasionally until thick and creamy.\n"
                                              "2.	Stir in chopped spinach while in saucepan.\n"
                                              "3.	Take off heat and add squash, spices, and salt and pepper to taste.\n"
                                              "4.	Top with fried egg, if desired, and serve warm.\n"];
    self.breakfastRecipeArray = @[avocadoToast, eggInAvocado, avocadoBreakfastPudding, blackBeanEggAndAvocadoWrap, smokedSalmonAvocadoToast, berryBreakfastQuinoa, rawVeganBlueberryCoconutBreakfastShake, rawRaspberryBreakfastBar, breakfastBerrySmoothieWithCacaoDrizzleAndChia, ultimateBlueberryAndBananaBreakfastSmoothie, eggsWithSpinachAndCremeFraiche, poachedEggsWithRoastedTomatoes, watercressWithGarlicAndScrambledEggs, hardBoiledEggsWithAvocado, avocadosYHuevosCaliente, kaleAvocadoSalad, auntyPsKaleSalad, kaleSaladWithBloodOrangeAndMeyerLemon, garlickyKaleWithFriedEggsAndSalsa, kaleBerryAndAcaiPowerSmoothie, oatmealCasserole, oatmealWithBananaAndWalnuts, savoryOatmealWithSoftCookedEgg, savoryOatsWithBrieAndCherryTomatoes, oatmealWithSquashAndSpinach];
    [self chooseFeaturedRecipe];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    self.mutableFavoritesBreakfastRecipeArray = [NSMutableArray array];
    for (NSData *data in [[NSUserDefaults standardUserDefaults]objectForKey:kKeyToFavoritesArray]) {
        NATRecipe *recipe = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if (recipe) {
            [self.mutableFavoritesBreakfastRecipeArray addObject:recipe];
            NSLog(@"recipe found in user defaults");
        } else {
            NSLog(@"recipe not in user defaults");
        }
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([segue.identifier isEqualToString:@"goToRecipes"]) {
        NATRecipeCollectionViewController *destinationViewController = (NATRecipeCollectionViewController *)segue.destinationViewController;
        destinationViewController.breakfastRecipeArray = self.breakfastRecipeArray;
    }
    
    if ([segue.identifier isEqualToString:@"showFeaturedRecipe"]) {
        NATLargeRecipeViewController *destinationViewController = (NATLargeRecipeViewController *)segue.destinationViewController;
        destinationViewController.recipe = self.featuredRecipe;

        destinationViewController.recipeLabeltext = self.featuredRecipe.label;
        destinationViewController.recipeImageImage = self.featuredRecipe.recipeImage;

    }
    
    // Pass the selected object to the new view controller.
}


- (IBAction)favoriteButtonPressed:(id)sender {
    if (self.breakfastRecipeArray.count > 0) {
        [self performSegueWithIdentifier:@"favoritesExist" sender:self];
        NSLog(@"favorites exist");
        
    } else {
        [self performSegueWithIdentifier:@"favoritesDoNotExist" sender:self];
        NSLog(@"favorites don't exist");

    }
    
}

-(void)chooseFeaturedRecipe
{
    int randomArrayIndex = arc4random() % self.breakfastRecipeArray.count;
    self.featuredRecipe = self.breakfastRecipeArray[randomArrayIndex];
    self.featuredRecipeImage.image = self.featuredRecipe.recipeImage;
    self.featuredRecipeLabel.text = self.featuredRecipe.label;
    
   UITapGestureRecognizer *imageTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToFeaturedRecipeDetail)];
    UITapGestureRecognizer *labelTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goToFeaturedRecipeDetail)];

    
    [imageTapped setNumberOfTapsRequired:1];
    [self.featuredRecipeImage setUserInteractionEnabled:YES];
    [self.featuredRecipeImage addGestureRecognizer:imageTapped];
    [self.featuredRecipeLabel setUserInteractionEnabled:YES];
    [self.featuredRecipeLabel addGestureRecognizer:labelTapped];
    
    NSLog(@"the featured recipe today is: %@", self.featuredRecipe);
}

-(void)goToFeaturedRecipeDetail
{
    NSLog(@"Tap recognized");
    [self performSegueWithIdentifier:@"showFeaturedRecipe" sender:self];
}
@end
