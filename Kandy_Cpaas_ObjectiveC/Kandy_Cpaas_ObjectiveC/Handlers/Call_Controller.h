//
//  Call_Controller.h
//  Test_IOS_Project
//
//  Created by Viviksha on 26/09/19.
//  Copyright © 2019 Ribbon. All rights reserved.
//
#import "BaseViewController.h"
#import <UIKit/UIKit.h>
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface Call_Controller : BaseViewController <CPCallApplicationDelegate>

@property(strong, nonatomic) CPaaS* cpaas;

@end

NS_ASSUME_NONNULL_END
