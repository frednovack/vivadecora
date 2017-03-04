//
//  VenueCell.h
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/2/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VenueCell : UITableViewCell
@property(nonatomic,strong)UIImageView *venueImage;
@property(nonatomic,strong)UIImageView *eyeIcon;
@property(nonatomic,strong)UILabel *viewsLabel;
@property(nonatomic,strong)UILabel *venueName;
@property(nonatomic,strong)UILabel *note;
@property(nonatomic,strong)UILabel *local;
@property(nonatomic,strong)NSDictionary *theVenue;

-(void)setVenueWithDictionary:(NSDictionary*)venueInfo;

@end
