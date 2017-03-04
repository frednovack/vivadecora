//
//  VenueCell.m
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/2/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import "VenueCell.h"

#import <SDWebImage/UIImageView+WebCache.h>


@implementation VenueCell
{
    UIImageView *venueImage;
    UIImageView *eyeIcon;
    UILabel *viewsLabel;
    UILabel *venueName;
    UILabel *note;
    UILabel *local;
    
}

NSString *const image_base_url = @"https://aviewfrommyseat.com/wallpaper/";


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setVenueWithDictionary:(NSDictionary*)venueInfo{
    
    
    //Delete previous views
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //configure venue image
    venueImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.56)];
    
    [venueImage setContentMode:UIViewContentModeScaleAspectFit];
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@",image_base_url,venueInfo[@"image"]]];
    
    [venueImage sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        //set zoomed effect
        UIImageView *zoomer = [[UIImageView alloc]initWithFrame:venueImage.frame];
        [zoomer setImage:venueImage.image];
        //create effect
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        //add effect to view
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:blur];
        effectView.frame = venueImage.frame;
        [zoomer addSubview:effectView];
        
        [self.contentView addSubview:zoomer];
        [self.contentView addSubview:venueImage];

    
        
    }];
    
    [venueImage setOpaque:NO];
    
    //configure venue title label
    venueName = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width * 0.06, self.frame.size.height * 0.66, self.frame.size.width * 0.7, 18)];
    
    venueName.text = venueInfo[@"venue"];
    
    venueName.font = [UIFont fontWithName:@"Helvetica Bold" size:17];
    
    //configure eye icon with views label
    eyeIcon = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - 40, self.frame.size.height * 0.63, 30, 30)];
    
    eyeIcon.image = [UIImage imageNamed:@"eye-icon"];
    
    [eyeIcon setContentMode:UIViewContentModeScaleAspectFit];
    
    viewsLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 40, ((self.frame.size.height * 0.63) + 32), 30, 15)];
    
    viewsLabel.text = venueInfo[@"views"];
    
    viewsLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    
    viewsLabel.textAlignment = NSTextAlignmentCenter;
    
    //configure note label
    note = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width * 0.06, (self.frame.size.height * 0.66 + 25), self.frame.size.width * 0.7, 17)];
    
    note.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    note.text = venueInfo[@"note"];
    
    //configure local label
    local = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width * 0.06, note.frame.origin.y + 25, self.frame.size.width * 0.7, 17)];
    
    //local.textColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    
    local.text = venueInfo[@"home"];
    
    local.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    
    [self.contentView addSubview:local];
    [self.contentView addSubview:note];
    [self.contentView addSubview:viewsLabel];
    [self.contentView addSubview:eyeIcon];
    [self.contentView addSubview:venueName];
    
    
}



- (void)setFrame:(CGRect)frame {

    frame.origin.x = frame.size.width * 0.03;
    
    frame.size.width = frame.size.width * 0.94;
    
    frame.size.height = 300;
    
    self.clipsToBounds = YES;
    
    [self.layer setCornerRadius:7.0f];
    
    [super setFrame:frame];
}

@end
