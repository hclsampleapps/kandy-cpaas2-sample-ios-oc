//
//  AddressListViewController.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/10/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AddressListTableViewCell.h"

@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface AddressListViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tblVw;
@property (weak, nonatomic) IBOutlet  UILabel    *lblNoRecord;

@property(strong, nonatomic) CPaaS* cpaas;

@end

NS_ASSUME_NONNULL_END
