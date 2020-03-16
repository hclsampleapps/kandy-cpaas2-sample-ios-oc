//
//  AddressListTableViewCell.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/10/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressListTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel        *lblName;
@property (nonatomic, weak) IBOutlet UILabel        *lblEmail;
@property (nonatomic, weak) IBOutlet UIImageView    *imgBg;

@end

NS_ASSUME_NONNULL_END
