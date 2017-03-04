//
//  API_Comm.h
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/3/17.
//  Copyright © 2017 frednovack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API_Comm : NSObject

-(void)getAllViewsUpponFinishBlock:(void (^)(NSDictionary *allObjects))callbackBlock;
-(void)detailVenueWithName:(NSString*)venueName WithCompletionBlock:(void (^)(NSDictionary *venueDic))callbackBlock;


@end
