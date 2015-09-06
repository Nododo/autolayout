//
//  CustomController.m
//  autolayout
//
//  Created by 杜 维欣 on 15/9/1.
//  Copyright (c) 2015年 nododo. All rights reserved.
//

#import "CustomController.h"
#import "CustomModel.h"
#import "CustomCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "NSLayoutConstraintsController.h"

@interface CustomController ()
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation CustomController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.estimatedRowHeight = 200;
    [self productData];
    

}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)productData {
    for (int i = 0 ; i < 40; i ++ ) {
        CustomModel * model = [[CustomModel alloc] init];
        model.title = [NSString stringWithFormat:@"%d",i];
        NSString *content = @"";
        for (int j = 0; j < i+1 ; j ++) {
            content = [content stringByAppendingString:@"abcdefg"];
        }
        model.content = content;
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"custom" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"custom" cacheByIndexPath:indexPath configuration:^(CustomCell *cell) {
       cell.model = self.dataArray[indexPath.row];
    }];
    
//    return [CustomCell calHeightWithModel:self.dataArray[indexPath.row]];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLayoutConstraintsController *vc = segue.destinationViewController;
    vc.isLand = YES;
    NSLog(@"%@",segue.destinationViewController);
}


- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
@end
