//
//  ProjectLoginViewController.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 10/17/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@import CPUtilities;
@import CPaaSSDK;
@import CPAuthenticationService;

@interface ProjectLoginViewController : BaseViewController

@property(strong, nonatomic) NSString *accessToken;
@property(strong, nonatomic) NSString *idToken;
@property(strong, nonatomic) NSString *refreshToken;
@property(strong, nonatomic) NSString *channelInfo;
@property(strong, nonatomic) CPaaS *CPaaS;

@property(nonatomic, weak) IBOutlet UIView *container_View;
@property(nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property(nonatomic, weak) IBOutlet UIView *privateprojectkey_View;
@property(nonatomic, weak) IBOutlet UIView *privateprojectsecret_View;
@property(nonatomic, weak) IBOutlet UIView *baseUrl_View;
@property (nonatomic, weak) IBOutlet UITextField *privateprojectkey_Field;
@property (nonatomic, weak) IBOutlet UITextField *baseUrl_Field;
@property (nonatomic, weak) IBOutlet UITextField *privateprojectsecret_Field;

@end

NS_ASSUME_NONNULL_END
