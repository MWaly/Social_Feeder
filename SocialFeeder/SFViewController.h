//
//  SFViewController.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/14/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownListView.h"
@interface SFViewController : UIViewController <UITableViewDataSource,UITableViewDelegate , kDropDownListViewDelegate>
/// mutable array carrying all items

@property (nonatomic,strong) NSMutableArray *arrayOfItems;
- (IBAction)filterAction:(UIButton*)sender;
@end
