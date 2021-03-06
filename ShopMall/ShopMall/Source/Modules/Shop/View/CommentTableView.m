//
//  CommentTableView.m
//  ShopMall
//
//  Created by KingsleyYau on 13-4-16.
//  Copyright (c) 2013年 KingsleyYau. All rights reserved.
//

#import "CommentTableView.h"

#import "CommentTableViewCell.h"
#import "CenteralTextTableViewCell.h"

@implementation CommentTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}
- (void)initialize {
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.separatorColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5;
    self.hasMore = NO;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];
}
#pragma mark - 列表界面回调 (UITableViewDataSource / UITableViewDelegate)
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    int count = 1;
    return count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger number = 0;
    switch(section) {
        case 0: {
            if(self.items.count > 0) {
                tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
                number = self.items.count;
                if(_hasMore) {
                    // 需要显示更多按钮
                    number += 1;
                }
            }
            else {
                tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                number = 0;
            }
        }
        default:break;
    }
	return number;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 0;
    
    if (indexPath.row < self.items.count) {
        Comment *item = [self.items objectAtIndex:indexPath.row];
        height = [CommentTableViewCell cellHeight:tableView detailString:item.body];
    }
    else {
        height = [CenteralTextTableViewCell cellHeight];
    }
    return height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *result = nil;
    if (indexPath.row < self.items.count) {
        CommentTableViewCell *cell = [CommentTableViewCell getUITableViewCell:tableView];
        
        Comment *item = [self.items objectAtIndex:indexPath.row];
        
        cell.userLabel.text = item.custom.customName;
        cell.kkRankSelector.curRank = [item.score integerValue] / RankOfScore;
        cell.priceAvgLabel.text = [NSString stringWithFormat:@"人均:¥%@", item.shop.priceAvg];
        cell.detailLabel.text = item.body;
        cell.dateLabel.text = [item.time toString2YMDHM];
        result = cell;
    }
    else {
        CenteralTextTableViewCell *cell = [CenteralTextTableViewCell getUITableViewCell:tableView];
        result = cell;
        cell.titleLabel.text = @"加载更多";
    }
    return result;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < self.items.count) {
        if([self.tableViewDelegate respondsToSelector:@selector(tableView:didSelectComment:)]) {
            [self.tableViewDelegate tableView:self didSelectComment:[self.items objectAtIndex:indexPath.row]];
        }
    }
    else {
        if([self.tableViewDelegate respondsToSelector:@selector(didSelectMore:)]) {
            [self.tableViewDelegate didSelectMore:self];
        }
    }
}
#pragma mark - 滚动界面回调 (UIScrollViewDelegate)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.tableViewDelegate scrollViewDidScroll:scrollView];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([self.tableViewDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)]) {
        [self.tableViewDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}
@end
