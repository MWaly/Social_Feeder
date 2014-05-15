//
//  SFFeedTableViewCell.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/15/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFFeedTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *source;

@end
