//
//  SFItem.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The data model which is to be understood by the VC when displaying data , this is the generic one and categories would be made for special handling
 */
@interface SFItem : NSObject

/**
 *  Main Title
 */
@property (nonatomic, copy) NSString *title;

/**
 *  Detailed Info
 */

@property (nonatomic, copy) NSString *detail;

/**
 *  Source (e.g Foursquare , Ny , etc..)
 */
@property (nonatomic, unsafe_unretained) FeedSource source;

/**
 *  Image if any
 */
@property (nonatomic, strong) NSString *imageURL;

/**
 *  Link If Any
 */

@property (nonatomic, copy) NSString *link;

@property (nonatomic, strong) NSDate *date;


@end
