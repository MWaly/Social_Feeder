//
//  SFBusinessHandler.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.


#import <Foundation/Foundation.h>
/**
 * //  General class methods for handling business logic required
 */
@interface SFBusinessHandler : NSObject

/**
 *  Parsing the itunes feed and passing it to the VC's
 *
 *  @param itunesFeed arrayOfMWFeed items
 */
+ (void)parseItunesFeed:(NSArray *)itunesFeed;

/**
 *  Parsing the NY feed and passing it to the VC's
 *
 *  @param NY arrayOfMWFeed items
 */
+ (void)parseNyFeed:(NSArray *)nyFeed;

/**
 *  General Error parsing with distinction for the source only
 *
 *  @param source source code
 */
+ (void)parseError:(FeedSource)source;

/**
 *  Filtering the current items handling
 *
 *  @param options    Feed source options
 *  @param allObjects all objects array
 *
 *  @return filtered array 
 */
+ (NSArray *)filterTheArrayWithOptions:(NSArray *)options andWholeArray:(NSArray *)allObjects;

@end
