//
//  SFBusinessHandler.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//  General class methods for handling business logic required

#import <Foundation/Foundation.h>

@interface SFBusinessHandler : NSObject

+ (void) parseItunesFeed:(NSArray*)itunesFeed;
@end
