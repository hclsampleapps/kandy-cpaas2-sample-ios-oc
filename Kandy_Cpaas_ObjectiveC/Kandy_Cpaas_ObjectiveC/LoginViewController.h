//
//  ViewController.h
//  Test_IOS_Project
//
//  Created by Viviksha on 02/05/19.
//  Copyright © 2019 Ribbon. All rights reserved.
//

#import <UIKit/UIKit.h>

@import CPUtilities;
@import CPaaSSDK;
@import CPAuthenticationService;

@interface LoginViewController : UIViewController


@property(strong, nonatomic) NSString *accessToken;
@property(strong, nonatomic) NSString *idToken;
@property(strong, nonatomic) NSString *refreshToken;
@property(strong, nonatomic) NSString *channelInfo;

@property(strong, nonatomic) CPaaS *CPaaS;

@property (nonatomic, weak) IBOutlet UITextField *clienId;
@property (nonatomic, weak) IBOutlet UITextField *username;
@property (nonatomic, weak) IBOutlet UITextField *password;
@property (nonatomic, weak) IBOutlet UITextView *accessTokenTextView;
@property (nonatomic, weak) IBOutlet UITextView *channelInfoTextView;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView* activityIndicatorView;

- (IBAction)pushToServiceController;

@end



