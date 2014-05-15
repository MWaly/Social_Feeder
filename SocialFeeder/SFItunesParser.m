//
//  SFItunesParser.m
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/15/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import "SFItunesParser.h"
#import "NSString+HTML.h"

@implementation SFItunesParser

+ (instancetype)initWithFeed:(NSURL*)url
{
    
        
    return [[SFItunesParser alloc]initWithURL:url];
}

- (instancetype)initWithURL:(NSURL*)url
{
    self = [super init];
    if (self) {
        MWFeedParser   *feedParser = [[MWFeedParser alloc] initWithFeedURL:url];
        
        feedParser.delegate = self;
        feedParser.feedParseType = ParseTypeItemsOnly;
        feedParser.connectionType = ConnectionTypeSynchronously;
        [feedParser parse];
        
        // The array to store the feeds otno

    }
    return self;
}
#pragma mark - 'MWParser' delegates

- (void)feedParserDidStart:(MWFeedParser *)parser
{
    NSLog(@"I am here");
      self.feedsItemsArray=[@[]mutableCopy];
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info
{
    NSLog(@"The current item %@ %@ %@" , info.title, info.link,info.summary);
}
- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
    
    // Adding image support
    if (item) {
        NSString *htmlContent = item.content;
        NSString *imgSrc;
        
        // find match for image
        NSRange rangeOfString = NSMakeRange(0, [htmlContent length]);
        NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"(<img.*?src=\")(.*?)(\".*?>)" options:0 error:nil];
        
        if ([htmlContent length] > 0) {
            NSTextCheckingResult *match = [regex firstMatchInString:htmlContent options:0 range:rangeOfString];
            
            if (match != NULL ) {
                NSString *imgUrl = [htmlContent substringWithRange:[match rangeAtIndex:2]];
                NSLog(@"url: %@", imgUrl);
                item.itunesImage=imgUrl;
                //NSLog(@"match %@", match);
                if ([[imgUrl lowercaseString] rangeOfString:@"feedburner"].location == NSNotFound) {
                    imgSrc = imgUrl;
                }
            }
        }
    }
    
    
    [self.feedsItemsArray addObject:item];

    NSLog(@"The current item %@ %@ %@" , item.title, item.link,item.author);
}
- (void)feedParserDidFinish:(MWFeedParser *)parser
{
    [[NSNotificationCenter defaultCenter] postNotificationName:SFNetworkDidRetrieveItunesFeed object:self.feedsItemsArray];
}
- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:SFNetworkDidRetrieveItunesFeedError object:error];
    NSLog(@"Error foudn with code %@",[error localizedDescription]);
}

@end
