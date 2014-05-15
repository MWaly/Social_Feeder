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
extern NSString *const SFNetworkDidRetrieveNYTimesFeed;
extern NSString *const SFNetworkDidRetrieveNYTimesFeedError;
extern NSString *const SFNetworkDidRetrieveFoursquare;
extern NSString *const SFNetworkDidRetrieveFoursquareError;







#pragma mark - VC Notifications -
extern NSString *const SFVCDidRetrieveItunesFeed;
extern NSString *const SFVCDidRetrieveItunesFeedError;
extern NSString *const SFVCDidRetrieveNYTimesFeed;
extern NSString *const SFVCDidRetrieveNYTimesFeedError;
extern NSString *const SFVCDidRetrieveFoursquare;
extern NSString *const SFVCDidRetrieveFoursquareError;
@end
