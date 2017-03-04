//
//  ViewController.m
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/2/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import "ViewController.h"
#import "VenueCell.h"
#import "API_Comm.h"
#import "Reachability.h"
#import "VenueDetailViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

NSString *const url = @"https://aviewfrommyseat.com/avf/api/featured.php?appkey=f6bcd8e8bb853890f4fb2be8ce0418fa";

NSDictionary *venues;

@synthesize venueTable;

-(void)viewWillLayoutSubviews{
    [venueTable setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
}

-(void)testConnection{
    //checks for internet connection
    UIAlertAction *retryButton;
    UIAlertController *alert;
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable)
    {
        alert = [UIAlertController
                                    alertControllerWithTitle:@"Oops! Sem conexão!"
                                    message:@"Você está sem conexão, conecte-se a rede celular ou wifi para acessar os dados do aplicativo."
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        retryButton = [UIAlertAction
                                      actionWithTitle:@"Tentar Novamente"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * action) {
                                          [self testConnection];
                                      }];
        [alert addAction:retryButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        [self getAllVenues];
    }
    


    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testConnection];
    
    
    
    //Personalization of the screen
    venues = [[NSDictionary alloc]init];

    [venueTable setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1]];
    //bluewish color
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.286 green: 0.509 blue: 0.772 alpha: 1.0];
    
    self.title = @"Viva Decora";
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getAllVenues{
    API_Comm *comm = [[API_Comm alloc]init];
    
    [comm getAllViewsUpponFinishBlock:^(NSDictionary *allObjects) {
        venues = allObjects;
        [venueTable reloadData];
    }];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [venues[@"avfms"]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     VenueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"venueCell" forIndexPath:indexPath];
     
     [cell setVenueWithDictionary:[venues[@"avfms"] objectAtIndex:indexPath.section]];
     
 
 // Configure the cell...

 
 return cell;
 }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VenueCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:@"detailVenueSegue" sender:selectedCell];

}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Segue Control
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    VenueCell *selectedVenue = sender;
    
    if ([[segue identifier] isEqualToString:@"detailVenueSegue"]) {
        
        VenueDetailViewController *vc = (VenueDetailViewController*)[segue destinationViewController];
        
        vc.venueImage = selectedVenue.venueImage.image;

        vc.venueName = selectedVenue.theVenue[@"venue"];
        

    }
    
}

@end
