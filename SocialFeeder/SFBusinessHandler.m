//
//  SFBusinessHandler.m
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import "SFBusinessHandler.h"
#import "SFItem.h"

#import "MWFeedItem.h"
#import "SFNotifications.h"
#import "NSString+HTML.h"
@implementation SFBusinessHandler


+ (void) parseItunesFeed:(NSArray*)itunesFeed
{
    NSMutableArray* arrayOfVCItems=[@[]mutableCopy];
// Converting to VC format here
    for (MWFeedItem* feedItem in itunesFeed[0]) {
    
        SFItem* item=[[SFItem alloc]init];
        item.title=feedItem.title? feedItem.title :@"[NO Title]";
        item.detail=feedItem.summary ? feedItem.summary: @"[NO Summary]" ;
        item.source=Itunes;
        item.link=feedItem.link ? feedItem.link : @"[NO Link]";
        item.date=feedItem.date ? feedItem.date : [NSDate date];
        item.imageURL=feedItem.itunesImage? feedItem.itunesImage:PlaceHolder;
        [arrayOfVCItems addObject:item];
        
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:SFVCDidRetrieveItunesFeed object:arrayOfVCItems];
}

@end
