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
#import "Foursquare2.h"
#import "SFFourSquareVeneuesParser.h"


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

- (void)getListOfNearbyPlaceFromDubizzle
{
    [Foursquare2 venueExploreRecommendedNearByLatitude:Dubizzle_lon longitude:Dubizzle_lat near:nil accuracyLL:@500 altitude:@0 accuracyAlt:@1000 query:nil limit:@20 offset:@0 radius:nil section:nil novelty:nil sortByDistance:YES openNow:NO venuePhotos:YES price:nil callback:^(BOOL success, id result) {
        
        NSDictionary* dictOfResults = (NSDictionary*)result[@"response"];
     // pass it now to the foursquare parser to handle the rest
          ;
        [SFFourSquareVeneuesParser initWithArray:[dictOfResults valueForKeyPath:@"groups.items.venue"]];
       
    } ];
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
