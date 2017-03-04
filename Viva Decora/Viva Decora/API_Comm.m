//
//  API_Comm.m
//  Viva Decora
//
//  Created by Frederico Novack Amaral Pereira on 3/3/17.
//  Copyright © 2017 frednovack. All rights reserved.
//--------------------------------------------------
//THIS OBJECT IS RESPOSABLE FOR COMMUNICATIONS WITH THE API
//ALL METHODS FOR WEBSERVICE SHOULD BE IMPLEMENTED HERE
//--------------------------------------------------

#import "API_Comm.h"
#import <AFNetworking.h>

@implementation API_Comm
    NSString *const baseUrl = @"https://aviewfrommyseat.com/avf/api/featured.php?appkey=f6bcd8e8bb853890f4fb2be8ce0418fa";



-(void)getAllViewsUpponFinishBlock:(void (^)(NSDictionary *allObjects))callbackBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:baseUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        callbackBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Failed to get stuff");
    }];
    
}
@end
