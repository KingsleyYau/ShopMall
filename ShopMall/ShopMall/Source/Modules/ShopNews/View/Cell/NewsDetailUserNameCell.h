//
//  NewsDetailUserNameCell.h
//  DrPalm4EBaby
//
//  Created by KingsleyYau on 13-9-5.
//  Copyright (c) 2013年 KingsleyYau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailUserNameCell : UITableViewCell
@property (nonatomic, weak) IBOutlet KKTextField *textField;

+ (NSString *)cellIdentifier;
+ (NSInteger)cellHeight;
+ (id)getUITableViewCell:(UITableView*)tableView;
@end
