//
//  SFNotifications.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Constants for notification system 
 */
@interface SFNotifications : NSObject


#pragma mark - Network Notifications -
extern NSString *const SFNetworkDidRetrieveItunesFeed;
extern NSString *const SFNetworkDidRetrieveItunesFeedError;







#pragma mark - VC Notifications -
extern NSString *const SFVCDidRetrieveItunesFeed;
extern NSString *const SFVCDidRetrieveItunesFeedError;
@end
