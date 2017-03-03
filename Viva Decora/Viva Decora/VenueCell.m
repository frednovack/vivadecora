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
    UILabel *venueName;
    UILabel *note;
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
    
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    venueImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.56)];
    
    [venueImage setContentMode:UIViewContentModeScaleAspectFit];
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@",image_base_url,venueInfo[@"image"]]];
    
    [venueImage sd_setImageWithURL:url];
    
    [self.contentView addSubview:venueImage];
    
    
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
