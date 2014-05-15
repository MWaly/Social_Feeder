//
//  SFSyncer.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.


/**
 *   Singelton Class Object Acting as a mediator between the VC and the NEtwork and handles the business logic associated within
 */
#import <Foundation/Foundation.h>


@interface SFSyncer : NSObject

/**
 *  Singelton instance retrieval
 *
 *  @return single intance of the object
 */
+ (SFSyncer *)syncer;



/**
 *  List of middle-east-News by NYTimes
 *
 *  @return operation perfromed
 */

- (void)getListOfNYNews;


/**
 *  List of parsed songs in top chart of itunes
 *
 *  @return operation perfromed
 */

- (void )getListOfiTunesSongs;

/**
 *  List of parsed places retrieved around Dubizzle HQ using Foursquare
 *
 *  @return operation perfromed
 */

- (NSOperation *)getListOfNearbyPlace;


/**
 *  Stop current requests in the queue
 */
- (void)cancelNetworkRequests;


@end
