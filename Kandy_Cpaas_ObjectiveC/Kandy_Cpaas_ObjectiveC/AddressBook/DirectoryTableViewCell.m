//
//  DirectoryTableViewCell.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/9/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "DirectoryTableViewCell.h"

@implementation DirectoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)displayContentTypewith : (DirectoryBO*)object{
    
    _lblName.text = object.name;
    _lblFirstName.text = object.firstName;
    _lblLastName.text = object.lastName;
    _lblEmail.text = object.email;
    _lblUserId.text = object.userId;
    _lblPhotoUrl.text = object.photoUrl;
    _imgBuddy.image = object.isBuddy ? [UIImage imageNamed:@"selected"] : [UIImage imageNamed:@"unSelected"];
    _imgBg.layer.borderWidth = 1.0;
    _imgBg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _imgBg.layer.cornerRadius = 4.0;
    _imgBg.layer.masksToBounds = YES;
    
}

+(CGFloat)height{
    return 412;
}


@end
