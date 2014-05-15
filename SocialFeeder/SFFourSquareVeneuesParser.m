//
//  SFFourSquareVeneuesParser.m
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/15/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import "SFFourSquareVeneuesParser.h"
#import "SFFourSquareVenueItem.h"
@implementation SFFourSquareVeneuesParser


+ (instancetype)initWithArray:(NSArray*)array
{

  return [[SFFourSquareVeneuesParser alloc]initWithArray:array];
}
- (instancetype)initWithArray:(NSArray*)array
{
    self = [super init];
    if (self) {
    
    // calling the parsing method here
        [self parse:[array copy]];
            
    }
    return self;
}

- (void)parse:(NSArray*)array
{
    NSMutableArray *arrayOfVenueItems=[@[]mutableCopy];
    for (NSDictionary* venueObject in array[0]) {
        SFFourSquareVenueItem *item=[[SFFourSquareVenueItem alloc]init];
        item.source=FourSquare;
        item.title=[venueObject valueForKey:@"name"];
        item.checkinCounts=[venueObject valueForKeyPath:@"stats.checkinsCount"];
        item.likes=[venueObject valueForKeyPath:@"likes.count"];
        item.imageURL=[NSString stringWithFormat:@"%@100x100%@",[venueObject valueForKeyPath:@"photos.groups.items.prefix"],[venueObject valueForKeyPath:@"photos.groups.items.suffix"]];
       item.imageURL= [item.imageURL stringByStandardizingPath];
        [arrayOfVenueItems addObject:item];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:SFNetworkDidRetrieveFoursquare object:arrayOfVenueItems userInfo:nil];
}
@end

