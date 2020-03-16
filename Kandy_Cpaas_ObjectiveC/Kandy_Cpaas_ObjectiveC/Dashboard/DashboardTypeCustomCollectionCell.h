//
//  DashboardTypeCustomCollectionCell.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 10/31/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DashboardTypeCustomCollectionCell : UICollectionViewCell

@property(nonatomic, weak) IBOutlet UILabel *lblName;
@property(nonatomic, weak) IBOutlet UIImageView *imgBg;
@property(nonatomic, weak) IBOutlet UIImageView *imgPreview1;

-(void)displayContentwithImage : (UIImage*)image andTitle : (NSString*)title;

@end

NS_ASSUME_NONNULL_END
