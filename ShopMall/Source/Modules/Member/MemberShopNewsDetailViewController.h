//
//  MemberShopNewsDetailViewController.h
//  ShopMall
//
//  Created by KingsleyYau on 13-12-25.
//  Copyright (c) 2013年 KingsleyYau. All rights reserved.
//

#import "BaseViewController.h"

@interface MemberShopNewsDetailViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, retain) ShopPersonalNews *item;

@end
