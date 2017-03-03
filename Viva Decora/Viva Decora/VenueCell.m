//
//  VenueCell.m
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/2/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import "VenueCell.h"

@implementation VenueCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setVenueWithDictionary:(NSDictionary*)venueInfo{
    
}


-(void)configureCell{
    
    CGRect superViewFrame = self.superview.frame;
    [self setBackgroundColor:[UIColor redColor]];
//    CGRect frame = CGRectMake((superViewFrame.size.width * 0.10), <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

- (void)setFrame:(CGRect)frame {

    frame.origin.x = frame.size.width * 0.03;
    
    frame.size.width = frame.size.width * 0.94;
    
    self.clipsToBounds = YES;
    
    [self.layer setCornerRadius:7.0f];
    
    
    
    
    [super setFrame:frame];
}

@end
