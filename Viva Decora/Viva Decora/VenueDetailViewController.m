//
//  VenueDetailViewController.m
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/4/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import "VenueDetailViewController.h"
#import "API_Comm.h"
#import <MapKit/MapKit.h>

@interface VenueDetailViewController ()

@end

@implementation VenueDetailViewController{
    NSArray *gps;
}

//components
@synthesize venueImage;
@synthesize venueName;
@synthesize zoomedEffectImgView;
@synthesize venueImageView;
@synthesize venueNoteLabel;
@synthesize venueLocalLabel;
@synthesize venueTitleLabel;
@synthesize averageRatingLabel;
@synthesize starImageView;
@synthesize statsTextView;
@synthesize linkButton;
@synthesize mapButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = venueName;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //Hide elements
    [starImageView setAlpha:0];
    [averageRatingLabel setAlpha:0];
    [statsTextView setAlpha:0];
    [linkButton setAlpha:0];
    [venueNoteLabel setAlpha:0];
    [venueLocalLabel setAlpha:0];
    [mapButton setAlpha:0];
    
    
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
    
    //get all data and present it to view
    [api detailVenueWithName:self.venueName WithCompletionBlock:^(NSDictionary *venueDic) {
        
        //creates an animation with the alpha of the elements
        [UIView animateWithDuration:1.5 delay:0.00 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            //Change Alpha of the necessary elements
            [venueNoteLabel setAlpha:1];
            [venueLocalLabel setAlpha:1];
            
            
            //write the necessary labels
            venueNoteLabel.text = venueDic[@"team"];
            
            venueLocalLabel.text = [NSString stringWithFormat:@"%@, %@, %@, %@",venueDic[@"address"],venueDic[@"city"], venueDic[@"state"],venueDic[@"country"]];
            
            if (![venueDic[@"average_rating"] isEqualToString:@""]) {
                
                [starImageView setAlpha:1];
                
                [averageRatingLabel setAlpha:1];
                
                averageRatingLabel.text = venueDic[@"average_rating"];
                
            }
            
            if (![venueDic[@"stats"] isEqualToString:@""]) {
                
                [statsTextView setAlpha:1];
                
                statsTextView.text = [venueDic[@"stats"] stringByReplacingOccurrencesOfString:@"<b>" withString:@" "];
                
                statsTextView.text = [statsTextView.text stringByReplacingOccurrencesOfString:@"</b>" withString:@" "];
                
                statsTextView.text = [statsTextView.text stringByReplacingOccurrencesOfString:@"<br>" withString:@" "];
                
            }
            
            if (![venueDic[@"sameas"] isEqualToString:@""]) {
                
                [linkButton setAlpha:1];
                
                NSArray *aux = [venueDic[@"sameas"] componentsSeparatedByString:@","];
                
                [linkButton setTitle:aux[0] forState:UIControlStateNormal];
                
            }
        
            
            if (![venueDic[@"gps"]isEqualToString:@""]) {
                
                [mapButton setAlpha:1];
                
                gps = [venueDic[@"gps"] componentsSeparatedByString:@","];
                
                
            }
        
        } completion:nil];
        

        
    }];

        
    
    
}

- (IBAction)mapButtonAction:(UIButton *)sender {
    
    //process to open maps with the longitude and altitude of the venue
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        // Create an MKMapItem to pass to the Maps app
        CLLocationCoordinate2D coordinate =
        CLLocationCoordinate2DMake([gps[0] doubleValue], [gps[1] doubleValue]);
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
                                                       addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName:venueName];
        // Pass the map item to the Maps app
        [mapItem openInMapsWithLaunchOptions:nil];
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)linkButtonAction:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sender.titleLabel.text]];

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
