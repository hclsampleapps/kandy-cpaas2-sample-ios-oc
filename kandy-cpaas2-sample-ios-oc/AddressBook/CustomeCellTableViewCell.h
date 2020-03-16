//
//  CustomeCellTableViewCell.h
//  kandy-cpaas2-sample-ios-oc
//
//  Created by Viviksha on 16/03/20.
//  Copyright © 2020 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DirectoryBO.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomeCellTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *lblFirstName;
@property (nonatomic, weak) IBOutlet UILabel *lblLastName;
@property (nonatomic, weak) IBOutlet UILabel *lblEmail;
@property (nonatomic, weak) IBOutlet UILabel *lblUserId;

-(void)displayContentTypewith : (DirectoryBO*)object;

+(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
