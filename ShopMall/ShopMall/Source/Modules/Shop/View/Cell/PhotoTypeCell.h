//
//  PhotoTypeCell.h
//  DrPalm4EBaby
//
//  Created by KingsleyYau on 13-9-5.
//  Copyright (c) 2013年 KingsleyYau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTypeCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet KKButtonBar *kkButtonBar;

+ (NSString *)cellIdentifier;
+ (NSInteger)cellHeight;
+ (id)getUITableViewCell:(UITableView*)tableView;
@end
