//
//  SMS_Controller.h
//  Test_IOS_Project
//
//  Created by Viviksha on 04/05/19.
//  Copyright © 2019 Ribbon. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface SMS_Controller : UIViewController  <CPSmsDelegate>

@property(strong, nonatomic) CPaaS* cpaas;

@end

NS_ASSUME_NONNULL_END
