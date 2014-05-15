//
//  SFFourSquareTableViewCell.h
//  SocialFeeder
//
//  Created by Mohamed Mokhles Waly on 5/15/14.
//  Copyright (c) 2014 Mokhles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFFourSquareTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *checkin;
@property (weak, nonatomic) IBOutlet UILabel *likes;

@end
