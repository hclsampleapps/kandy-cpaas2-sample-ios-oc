//
//  GroupCollectionCell.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 2/12/20.
//  Copyright © 2020 hcl. All rights reserved.
//

#import "GroupCollectionCell.h"

@implementation GroupCollectionCell

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

-(void)setupUI{
    self.status_imageView.layer.cornerRadius = self.status_imageView.frame.size.height/2;
    self.status_imageView.backgroundColor = UIColor.greenColor;
    self.name_lbl.text = @"";
    self.status_lbl.text = @"";
}
-(void)configCell:(NSString*)name withStatus:(NSString*)status{
    if (![status isEqualToString:@"Available"]) {
        self.status_imageView.backgroundColor = UIColor.yellowColor;
    }
    self.name_lbl.text = name;
    self.status_lbl.text = status;
}

@end
