//
//  VenueDetailViewController.m
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/4/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import "VenueDetailViewController.h"

@interface VenueDetailViewController ()

@end

@implementation VenueDetailViewController

@synthesize venueImage;
@synthesize venueName;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Venue -> %@",venueName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
