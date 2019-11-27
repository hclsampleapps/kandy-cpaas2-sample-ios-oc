//
//  AddressbookViewController.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/7/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "BaseViewController.h"
#import "AddressbookTableViewCell.h"
#import "DirectoryBO.h"
#import "AddressBookModule.h"
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface AddressbookViewController : BaseViewController
{
    AddressBookModule *address_Handler;
}
@property (weak, nonatomic) IBOutlet UITableView *tblVw;
@property (weak, nonatomic) IBOutlet UILabel     *lblNoRecord;
@property (weak, nonatomic) IBOutlet UIButton    *btnAddUpdate;
- (IBAction)btnAddUpdateTapped:(UIButton *)sender;

@property(strong, nonatomic) CPaaS* cpaas;
@property(strong, nonatomic) AddressbookBO* addressbook;
@property(assign, nonatomic) BOOL isToUpdate;
@end

NS_ASSUME_NONNULL_END
