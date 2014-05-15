//
//  SFFourSquareVeneuesParser.m
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/15/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import "SFFourSquareVeneuesParser.h"
#import "SFFourSquareVenueItem.h"
#import "NSString+HTML.h"

@implementation SFFourSquareVeneuesParser

/**
 *  Initilisation Methods , made this way for decoupling purposes
 *
 */

+ (instancetype)initWithArray:(NSArray *)array {
	return [[SFFourSquareVeneuesParser alloc]initWithArray:array];
}

- (instancetype)initWithArray:(NSArray *)array {
	self = [super init];
	if (self) {
		// calling the parsing method here
		[self parse:[array copy]];
	}
	return self;
}

/**
 *  Foursquare response parsing with some hacks as a workaround for minor bugs
 *
 *  @param array array of dicitonary objects reporesting the foursquare  response objects
 */

- (void)parse:(NSArray *)array {
	NSMutableArray *arrayOfVenueItems = [@[] mutableCopy];
	for (NSDictionary *venueObject in array[0]) {
		SFFourSquareVenueItem *item = [[SFFourSquareVenueItem alloc]init];
		item.source = FourSquare;
		item.title = [venueObject valueForKey:@"name"];
		item.checkinCounts = [venueObject valueForKeyPath:@"stats.checkinsCount"];
		item.likes = [venueObject valueForKeyPath:@"likes.count"];
		item.imageURL = [NSString stringWithFormat:@"%@100x100%@", [venueObject valueForKeyPath:@"photos.groups.items.prefix"], [venueObject valueForKeyPath:@"photos.groups.items.suffix"]];
		item.imageURL = [item.imageURL stringByReplacingOccurrencesOfString:@")" withString:@""];
		item.imageURL = [item.imageURL stringByReplacingOccurrencesOfString:@"(" withString:@""];
		item.imageURL = [item.imageURL stringByReplacingOccurrencesOfString:@"\"" withString:@""];
		// The very weird hack
		item.imageURL = [item.imageURL stringByRemovingNewLinesAndWhitespace];
		item.imageURL = [item.imageURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		item.imageURL = [item.imageURL stringByReplacingOccurrencesOfString:@"%20" withString:@""];
        
		[arrayOfVenueItems addObject:item];
	}
	if ([arrayOfVenueItems count] > 0) {
		[[NSNotificationCenter defaultCenter] postNotificationName:SFNetworkDidRetrieveFoursquare object:arrayOfVenueItems userInfo:nil];
	}
	else {
		[[NSNotificationCenter defaultCenter] postNotificationName:SFNetworkDidRetrieveFoursquareError object:arrayOfVenueItems userInfo:nil];
	}
}

@end
