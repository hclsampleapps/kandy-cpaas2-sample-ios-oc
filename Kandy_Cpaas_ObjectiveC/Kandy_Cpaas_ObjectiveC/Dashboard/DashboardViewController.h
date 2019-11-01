//
//  DashboardViewController.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 10/25/19.
//  Copyright © 2019 hcl. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface DashboardViewController : BaseViewController

@property(nonatomic , weak) IBOutlet UICollectionView *collectionVw;

@property(strong, nonatomic) CPaaS* cpaas;

@end

NS_ASSUME_NONNULL_END
