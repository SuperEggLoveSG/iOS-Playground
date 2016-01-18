//
//  CollectionViewsTableViewController.m
//  DemoCollectionView
//
//  Created by zj－db0465 on 16/1/18.
//  Copyright © 2016年 icetime17. All rights reserved.
//

#import "CollectionViewsTableViewController.h"
#import "CustomCollectionViewController.h"

#import "CollectionViewLayout.h"

@interface CollectionViewsTableViewController ()

@end

@implementation CollectionViewsTableViewController {
    
    NSArray *collectionViewTypes;

}

static NSString * const CellReuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    
    collectionViewTypes = @[@"Default Flow", @"Linear", @"Rotary", @"Carousel", @"CoverFlow", @"Horizontal"];
    
    [self addButtonBack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addButtonBack {
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(actionBack:)];
    self.navigationItem.leftBarButtonItem = btnBack;
}

- (void)actionBack:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return collectionViewTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellReuseIdentifier];
//    }
    
    cell.textLabel.text = collectionViewTypes[indexPath.row];
    
    return cell;
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

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewController *collectionViewVC;
    CollectionViewLayout *layout;
    switch (indexPath.row) {
        case 0:
            layout = [[CollectionViewLayout alloc] initWithType:Layout_DefaultFlow];
            break;
        case 1:
            layout = [[CollectionViewLayout alloc] initWithType:Layout_Linear];
            break;
        case 2:
            layout = [[CollectionViewLayout alloc] initWithType:Layout_Rotary];
            break;
        case 3:
            layout = [[CollectionViewLayout alloc] initWithType:Layout_Carousel];
            break;
        case 4:
            layout = [[CollectionViewLayout alloc] initWithType:Layout_CoverFlow];
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            break;
        case 5:
            layout = [[CollectionViewLayout alloc] initWithType:Layout_Horizontal];
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            break;
        default:
            break;
    }
    layout.itemSize = CGSizeMake(250, 250);
    
    collectionViewVC = [[CustomCollectionViewController alloc] initWithCollectionViewLayout:layout];
    
    [self.navigationController pushViewController:collectionViewVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
