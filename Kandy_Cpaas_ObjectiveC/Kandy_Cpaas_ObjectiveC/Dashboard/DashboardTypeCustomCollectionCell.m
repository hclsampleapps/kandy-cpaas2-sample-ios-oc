//
//  DashboardTypeCustomCollectionCell.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 10/31/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "DashboardTypeCustomCollectionCell.h"

@implementation DashboardTypeCustomCollectionCell

-(void)displayContentwithImage : (UIImage*)image andTitle : (NSString*)title{
    _lblName.text = title;
    _imgPreview1.image = image;
}


@end
