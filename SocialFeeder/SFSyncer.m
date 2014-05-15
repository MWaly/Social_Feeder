//
//  SFSyncer.m
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import "SFSyncer.h"
#import "AFNetworking.h"
#import "SFItunesParser.h"
#import "SFNYTimesParser.h"
#import "SFBusinessHandler.h"

@interface SFSyncer ()

- (void)recievedItunes:(NSNotification*)notif;

@end
@implementation SFSyncer



static SFSyncer *networkManager = nil;


#pragma mark - Initilization -
+ (SFSyncer *)syncer
{
	@synchronized(self)
	{
		if (networkManager == nil)
        {
			networkManager = [[SFSyncer alloc] init];
      
            
         }
	}
	return networkManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
              // Adding observers
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedItunes:) name:SFNetworkDidRetrieveItunesFeed object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedItunesError:) name:SFNetworkDidRetrieveItunesFeedError object:nil];
    }
    return self;
}
#pragma mark - Network Requests -


- (void)getListOfiTunesSongs
{
   [SFItunesParser initWithFeed:[NSURL URLWithString:ItunesTopChart]];
}
- (void)getListOfNYNews
{
    [SFNYTimesParser initWithFeed:[NSURL URLWithString:NYTimes]];
}


#pragma mark - Controlling Network Requests - 

- (void)cancelNetworkRequests
{

}


#pragma mark - Network Requests - 


- (void)recievedItunes:(NSNotification*)notif
{
    // Handling it business wise and forwarding it to the VC from their
  [SFBusinessHandler parseItunesFeed:[NSArray arrayWithObject:[notif object]]];

}

- (void) recievedItunesError:(NSNotification*)notif
{
    
    
}
#pragma mark - Dealloc -
- (void)dealloc
{
    // Getting Rid of the observers
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
