//
//  SFFeedParser.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/15/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MWFeedParser.h>
@interface SFFeedParser : NSObject <MWFeedParserDelegate>
+ (instancetype)initWithFeed:(NSURL*)url;

@property (nonatomic ,strong) NSMutableArray *feedsItemsArray;
@end
