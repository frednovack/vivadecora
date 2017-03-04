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
@synthesize zoomedEffectImgView;
@synthesize venueImageView;
@synthesize venueNoteLabel;
@synthesize venueLocalLabel;
@synthesize venueTitleLabel;
@synthesize capacityLabel;
@synthesize constructionCostLabel;
@synthesize openedLabel;
@synthesize surfaceLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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
