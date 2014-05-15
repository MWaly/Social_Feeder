//
//  SFFourSquareVenueItem.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/15/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.

/**
 *  Subclassing the SFItem for foursquare specific handling
 *
 */

#import "SFItem.h"

@interface SFFourSquareVenueItem : SFItem

@property (nonatomic, strong) NSNumber *checkinCounts;

@property (nonatomic, strong) NSNumber *likes;
@end
