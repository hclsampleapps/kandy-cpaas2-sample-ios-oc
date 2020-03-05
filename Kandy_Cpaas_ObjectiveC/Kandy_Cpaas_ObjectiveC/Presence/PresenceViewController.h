//
//  PresenceViewController.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 2/11/20.
//  Copyright © 2020 hcl. All rights reserved.
//

#import "BaseViewController.h"
#import "PresenceHandler.h"
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface PresenceViewController : BaseViewController
{
    PresenceHandler     *presenceHandler;
    NSArray             *activityTypesArray;
    NSMutableArray      *presenties;
    CPPresentityList    *prentiyList;
}
- (IBAction)updateStatus:(UIButton *)sender;
- (IBAction)showGroups:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel          *status_lbl;
@property (weak, nonatomic) IBOutlet UIPickerView     *status_pickerView;
@property (weak, nonatomic) IBOutlet UIImageView      *status_imgView;
@property (weak, nonatomic) IBOutlet UICollectionView *groupCollectionView;
@property(strong, nonatomic) CPaaS* cpaas;
@end

NS_ASSUME_NONNULL_END
