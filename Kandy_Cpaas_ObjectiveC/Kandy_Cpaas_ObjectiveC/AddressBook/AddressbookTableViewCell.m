//
//  AddressbookTableViewCell.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/10/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "AddressbookTableViewCell.h"

@implementation AddressbookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)displayContentTypewith : (AddressbookBO*)object{
  
    _txtContactId.text = object.contactId;
    _txtPrimaryContact.text = object.primaryContact;
    _txtFirstName.text = object.firstName;
    _txtLastName.text = object.lastName;
    _txtEmail.text = object.email;
    _txtHomePhoneNumber.text = object.homePhoneNumber;
    _txtBusinessPhoneNumber.text = object.businessPhoneNumber;
    _imgBuddy.image = object.isBuddy ? [UIImage imageNamed:@"selected"] : [UIImage imageNamed:@"unSelected"];
    
    _imgBg.layer.borderWidth = 1.0;
    _imgBg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _imgBg.layer.cornerRadius = 4.0;
    _imgBg.layer.masksToBounds = YES;
}
-(CGFloat)height{
    return 473;
}

- (IBAction)btnBuddyTappedWithSender:(UIButton *)sender{
    
}

@end
