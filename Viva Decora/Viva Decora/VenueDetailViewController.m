//
//  VenueDetailViewController.m
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/4/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import "VenueDetailViewController.h"
#import "API_Comm.h"

@interface VenueDetailViewController ()

@end

@implementation VenueDetailViewController

@synthesize venueImage;
@synthesize venueName;
@synthesize zoomedEffectImgView;
@synthesize venueImageView;
@synthesize venueNoteLabel;
@synthesize venueLocalLabel;
@synthesize venueTitleLabel;
@synthesize averageRatingLabel;
@synthesize starImageView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Hide elements
    [starImageView setAlpha:0];
    [averageRatingLabel setAlpha:0];
    
    
    //Setup images and its effects
    [zoomedEffectImgView setImage:venueImage];
    //create effect
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    //add effect to view
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:blur];
    effectView.frame = zoomedEffectImgView.frame;
    [zoomedEffectImgView addSubview:effectView];
    
    [venueImageView setImage:venueImage];
    
    [venueImageView setContentMode:UIViewContentModeScaleAspectFit];
    
    //Setup labels already known
    venueTitleLabel.text = self.venueName;
    
    
    API_Comm *api = [[API_Comm alloc]init];
    
    [api detailVenueWithName:self.venueName WithCompletionBlock:^(NSDictionary *venueDic) {
        
        NSLog(@"HERE > %@",venueDic);
        
        //write the necessary labels
        venueNoteLabel.text = venueDic[@"team"];
        
        venueLocalLabel.text = [NSString stringWithFormat:@"%@, %@, %@, %@",venueDic[@"address"],venueDic[@"city"], venueDic[@"state"],venueDic[@"country"]];
        
        if (![venueDic[@"average_rating"] isEqualToString:@""]) {
            [starImageView setAlpha:1];
            [averageRatingLabel setAlpha:1];
            averageRatingLabel.text = venueDic[@"average_rating"];
        }
        
    }];
    
    
    
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
