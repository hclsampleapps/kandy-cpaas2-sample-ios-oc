//
//  GroupCollectionCell.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 2/12/20.
//  Copyright © 2020 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroupCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel          *name_lbl;
@property (weak, nonatomic) IBOutlet UILabel          *status_lbl;
@property (weak, nonatomic) IBOutlet UIImageView      *status_imageView;

-(void)configCell:(NSString*)name withStatus:(NSString*)status;
@end

NS_ASSUME_NONNULL_END
