//
//  VenueDetailViewController.h
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/4/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueDetailViewController : UIViewController

@property (nonatomic,strong)UIImage *venueImage;
@property (nonatomic,strong)NSString *venueName;
@property (strong, nonatomic) IBOutlet UIImageView *zoomedEffectImgView;
@property (strong, nonatomic) IBOutlet UIImageView *venueImageView;
@property (strong, nonatomic) IBOutlet UILabel *venueTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *venueNoteLabel;
@property (strong, nonatomic) IBOutlet UILabel *venueLocalLabel;
@property (strong, nonatomic) IBOutlet UILabel *averageRatingLabel;
@property (strong, nonatomic) IBOutlet UIImageView *starImageView;
@property (strong, nonatomic) IBOutlet UITextView *statsTextView;


@end
