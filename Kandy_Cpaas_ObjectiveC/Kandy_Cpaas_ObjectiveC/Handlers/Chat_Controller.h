//
//  Chat_Controller.h
//  Test_IOS_Project
//
//  Created by Viviksha on 20/09/19.
//  Copyright © 2019 Ribbon. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface Chat_Controller : UIViewController <CPChatDelegate>

@property(strong, nonatomic) CPaaS* cpaasObject;

@end

NS_ASSUME_NONNULL_END
