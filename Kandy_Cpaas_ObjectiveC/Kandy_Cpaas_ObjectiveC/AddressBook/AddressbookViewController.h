//
//  AddressbookViewController.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/7/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "BaseViewController.h"
#import "AddressbookTableViewCell.h"

@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface AddressbookViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tblVw;
@property (weak, nonatomic) IBOutlet UILabel     *lblNoRecord;
@property (weak, nonatomic) IBOutlet UIButton    *btnAddUpdate;
- (IBAction)btnAddUpdateTapped:(UIButton *)sender;

@property(strong, nonatomic) CPaaS* cpaas;

@end

NS_ASSUME_NONNULL_END
