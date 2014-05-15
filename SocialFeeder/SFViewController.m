//
//  SFViewController.m
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SFViewController.h"
#import "SFSyncer.h"
#import "SFItem.h"

#import "SFFourSquareVenueItem.h"
#import "SFBusinessHandler.h"
#import "SFFourSquareTableViewCell.h"
#import "SFFeedTableViewCell.h"
#import "DateTools.h"
#import "NSString+HTML.h"
#import "UIImageView+AFNetworking.h"



@interface SFViewController ()
// Array which will present the data given
@property (nonatomic,strong) NSArray *currentArray;
// Table view item
@property (nonatomic,strong)IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *filterButton;
@property (strong, nonatomic) DropDownListView *dropDownList;
@property (strong, nonatomic) NSMutableArray *filterArray;
@end

@implementation SFViewController

#pragma mark - View Setup -
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Regitseration for notifcation system messages
    [self registerForNotifications];
    // Initilaising the mutablel holder array
	self.arrayOfItems=[@[]mutableCopy];
    
    // Sending the requests
    [[SFSyncer syncer] getListOfiTunesSongs];
    [[SFSyncer syncer] getListOfNearbyPlaceFromDubizzle];
    [[SFSyncer syncer] getListOfNYNews];
    
    // SEtup the popover
    self.dropDownList=[[DropDownListView alloc]initWithTitle:@"Select Options" options:@[@"Itunes Top Charts",@"NYTimes ME News",@"Foursquare Nearby Places"] xy:CGPointMake(10, 50) size:CGSizeMake(287, 280) isMultiple:YES];
    
 //   [self.dropDownList setCenter:self.view.center];
    [self.dropDownList SetBackGroundDropDwon_R:0 G:0 B:0 alpha:1];
    self.dropDownList.delegate=self;
    
    self.filterArray=[@[]mutableCopy];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) unregisterFromNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedItunes:) name:SFVCDidRetrieveItunesFeed object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedItunesError) name:SFVCDidRetrieveItunesFeedError object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedFoursquare:) name:SFVCDidRetrieveFoursquare object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedFoursquareError) name:SFVCDidRetrieveFoursquareError object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedNYTimes:) name:SFVCDidRetrieveNYTimesFeed object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedNYTimesError) name:SFVCDidRetrieveNYTimesFeedError object:nil];
    

}

#pragma mark - Handling Recieved Data - 

- (void)recievedItunes:(NSNotification*)notif
{
    NSArray* arrayOfItunesFeeds=(NSArray*)[notif object];
    [self.arrayOfItems addObjectsFromArray:arrayOfItunesFeeds];
    self.currentArray=self.arrayOfItems;
    [self.tableView reloadData];

}
- (void)recievedItunesError
{
    
    UIAlertView *alertView=[[UIAlertView alloc ]initWithTitle:@"Error" message:@"Couldn't Handle Itunes Feed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
    
}

- (void)recievedFoursquare:(NSNotification*)notif
{
    NSArray* arrayOfFourSquareVenues=(NSArray*)[notif object];
    [self.arrayOfItems addObjectsFromArray:arrayOfFourSquareVenues];
    self.currentArray=self.arrayOfItems;
    [self.tableView reloadData];
    
}
- (void)recievedFoursquareError
{
    
    UIAlertView *alertView=[[UIAlertView alloc ]initWithTitle:@"Error" message:@"Couldn't Handle Foursquare Venues List" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
    
}

- (void)recievedNYTimes:(NSNotification*)notif
{
    NSArray* arrayOfNyTimesFeed=(NSArray*)[notif object];
    [self.arrayOfItems addObjectsFromArray:arrayOfNyTimesFeed];
    self.currentArray=self.arrayOfItems;
    [self.tableView reloadData];
    
}
- (void)recievedNYTimesError
{
    
    UIAlertView *alertView=[[UIAlertView alloc ]initWithTitle:@"Error" message:@"Couldn't Handle NYTimes Middle-East Feed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
    
}

#pragma mark - Tableview Datasource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SFItem* currentItem=[self.currentArray objectAtIndex:indexPath.row];
    if (currentItem.source==FourSquare ) {
        return 162;
    }
    else
        return 117;
        

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.currentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *FeedCellIdentifier = @"feedCell";
    static NSString *FoursquareCellIdentifier = @"foursquareCell";
    
	SFFeedTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:FeedCellIdentifier];
    SFFourSquareTableViewCell *cell2 = [self.tableView dequeueReusableCellWithIdentifier:FoursquareCellIdentifier];
    SFItem* currentItem= [self.currentArray objectAtIndex:indexPath.row];
    
    if (currentItem.source!=FourSquare)
    {
        if (cell == nil)
        {
        cell = [[SFFeedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FeedCellIdentifier];
       
        }
        cell.title.text=currentItem.title;
        cell.summary.text=currentItem.detail;
        cell.date.text=[currentItem.date timeAgoSinceDate:currentItem.date];
         [cell.image setImageWithURL:[NSURL URLWithString:currentItem.imageURL] placeholderImage:nil];
        if (currentItem.source==Itunes)
        {
        cell.source.text=@"From Itunes";
       
            cell.layer.borderWidth=0.5;
            cell.layer.borderColor=[UIColor blackColor].CGColor;
        }
        else
        {
            cell.source.text=@"From NY ME";
            cell.layer.borderWidth=0.5;
            cell.layer.borderColor=[UIColor grayColor].CGColor;
        }
       
    	return cell;
    }
    else
    {
        if (cell2 == nil)
        {
        cell2 = [[SFFourSquareTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FoursquareCellIdentifier];
            
    }
        cell2.title.text=currentItem.title;
       
        [cell2.image setImageWithURL:[NSURL URLWithString:currentItem.imageURL ] placeholderImage:nil];
        NSLog(@"The imageURL is %@",currentItem.imageURL);
        cell2.checkin.text=[NSString stringWithFormat:@"%@",[currentItem valueForKey:@"checkinCounts"]];
        cell2.likes.text=[NSString stringWithFormat:@"%@",[currentItem valueForKey:@"likes"]];
        cell2.layer.borderWidth=0.5;
        cell2.layer.borderColor=[UIColor colorWithRed:0 green:0.670 blue:0.811 alpha:1].CGColor;

    return cell2;
        
	}
}

#pragma mark - Droplist Delegate -
// Show the popover here
- (IBAction)filterAction:(UIButton*)sender
{
    [self.dropDownList showInView:self.view animated:YES];
    
}

- (void)DropDownListView:(DropDownListView *)dropdownListView Datalist:(NSMutableArray *)ArryData
{
    NSLog(@"I am here");
    /// now invesitgate the options
    [self.filterArray removeAllObjects];
    for (NSString* optionString in ArryData)
    {
        if ([optionString isEqualToString:@"Foursquare Nearby Places"])
        {
            [self.filterArray addObject:@(FourSquare)];
        }
        else
        if ([optionString isEqualToString:@"Itunes Top Charts"])
        {
              [self.filterArray addObject:@(Itunes)];
        }
        else
            if ([optionString isEqualToString:@"NYTimes ME News"])
            {
            [self.filterArray addObject:@(NYTimesSource)];
        }
    }
    
    // Now handle the new data filtered
    [self filterNow];

}

- (void)DropDownListView:(DropDownListView *)dropdownListView didSelectedIndex:(NSInteger)anIndex
{
    NSLog(@"The chosen index is %i",anIndex);
}

- (void)DropDownListViewDidCancel
{
    NSLog(@"I am here nedes action after cancelling");
}

#pragma mark - Filteration 
- (void) filterNow
{
    self.currentArray=[SFBusinessHandler filterTheArrayWithOptions:self.filterArray andWholeArray:self.arrayOfItems];
    [self.tableView reloadData];

}

@end
