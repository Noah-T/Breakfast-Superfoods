//
//  NATRecipeTableViewController.m
//  Breakfast Superfoods
//
//  Created by Noah Teshu on 9/17/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "NATRecipeTableViewController.h"

@interface NATRecipeTableViewController ()


@end

@implementation NATRecipeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
            }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIImage *auntyPsKaleSalad = [UIImage imageNamed:@"aunty-ps-kale-salad"];
    UIImage *avocadoBreakfastPudding = [UIImage imageNamed:@"avocado-breakfast-pudding"];
    UIImage *avocadoBreakfastSalad = [UIImage imageNamed:@"avocado-breakfast-salad"];
    UIImage *avocadoKaleSalad = [UIImage imageNamed:@"avocado-kale-salad"];
    UIImage *eggBakedInAvocado = [UIImage imageNamed:@"egg-baked-in-avocado"];
    UIImage *kaleBananaSmoothie = [UIImage imageNamed:@"kale-banana-smoothie"];
    UIImage *kaleSaladWithBloodOranges = [UIImage imageNamed:@"kale-salad-with-blood-oranges"];
    UIImage *tomatoAvocadoToast = [UIImage imageNamed:@"tomato-avocado-toast"];
    self.breakfastPictureArray = @[auntyPsKaleSalad, avocadoBreakfastPudding, avocadoBreakfastSalad, avocadoKaleSalad, eggBakedInAvocado, kaleBananaSmoothie, kaleSaladWithBloodOranges, tomatoAvocadoToast];
    
    self.tableView.estimatedRowHeight = 75.0f;


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.breakfastPictureArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    
    // Configure the cell...
    cell.imageView.image = [self.breakfastPictureArray objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
