//
//  ShopNewsDownloadSmsViewController.h
//  ShopMall
//
//  Created by KingsleyYau on 13-12-25.
//  Copyright (c) 2013年 KingsleyYau. All rights reserved.
//

#import "BaseViewController.h"

@interface ShopNewsDownloadSmsViewController : BaseViewController
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, retain) ShopNews *item;

- (IBAction)downloadAction:(id)sender;
- (IBAction)savePictureAction:(id)sender;
@end
