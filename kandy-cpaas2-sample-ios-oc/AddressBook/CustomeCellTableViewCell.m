//
//  CustomeCellTableViewCell.m
//  kandy-cpaas2-sample-ios-oc
//
//  Created by Viviksha on 16/03/20.
//  Copyright © 2020 hcl. All rights reserved.
//

#import "CustomeCellTableViewCell.h"


@implementation CustomeCellTableViewCell

@synthesize lblEmail = _lblEmail;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)displayContentTypewith : (DirectoryBO*)object{
    _lblUserId.text = object.userId;
    _lblFirstName.text = object.firstName;
    _lblLastName.text = object.lastName;
    _lblEmail.text = object.email;
}

+(CGFloat)height{
    return 175;
}

@end
