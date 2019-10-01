//
//  ViewController.m
//  Test_IOS_Project
//
//  Created by Viviksha on 02/05/19.
//  Copyright © 2019 Ribbon. All rights reserved.
//

#import "LoginViewController.h"
#import "SMS_Controller.h"
#import "Call_Controller.h"

#define grantType @"password"
#define scopeId @"openid"
#define serverUrl @"https://oauth-cpaas.att.com/cpaas/auth/v1/token"
#define myAppDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _clienId.text = @"PUB-nesonukuv.34mv";
    _username.text = @"nesonukuv@planet-travel.club";
    _password.text = @"Test@123";
    // Do any additional setup after loading the view, typically from a nib.
    [self setConfiguration];
}

- (IBAction)login {
    [self getToken];
}

//-(void) getToken {
//    self.activityIndicatorView.hidden = false;
//    [self.activityIndicatorView startAnimating];
//    [self sendingAnHTTPPOSTRequestOniOSWithUserEmailId:@"pankhuri_15@next-mail.info" withPassword:@"Test@123" clientId:@"PUB-hcl.z9ht" grant_type:@"password" scope:@"openid"];
//}

-(void) getToken {
    if(self.password.text.length > 0 && self.password.text.length > 0 && self.clienId.text.length > 0) {
        self.activityIndicatorView.hidden = false;
        [self.activityIndicatorView startAnimating];
        [self sendingAnHTTPPOSTRequestOniOSWithUserEmailId:self.username.text withPassword:self.password.text clientId:self.clienId.text grant_type:grantType scope:scopeId];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please fill all the values." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES
                                      completion:nil];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

-(void)sendingAnHTTPPOSTRequestOniOSWithUserEmailId: (NSString *)emailId withPassword: (NSString *)password clientId:(NSString *)clientId grant_type: (NSString *)grant_type scope:(NSString *)scope{
    //Init the NSURLSession with a configuration
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //Create an URLRequest
    NSURL *url = [NSURL URLWithString:serverUrl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    //Create POST Params and add it to HTTPBody
    NSString *params = [NSString stringWithFormat:@"username=%@&password=%@&client_id=%@&grant_type=%@&scope=%@",emailId,password,clientId,grant_type,scope];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //Create task
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //Handle your response here
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        self.accessToken = [responseDict objectForKey:@"access_token"];
        self.idToken = [responseDict objectForKey:@"id_token"];
        self.refreshToken = [responseDict objectForKey:@"refresh_token"];
        if(self.accessToken) {
            self.accessTokenTextView.text = self.accessToken;
            [self getChannelInfo];
        }
    }];
    [dataTask resume];
}

-(void) setConfiguration {
    CPConfig *configuration = [CPConfig sharedInstance];
    configuration.restServerUrl = @"oauth-cpaas.att.com";
    configuration.useSecureConnection = YES;
    self.activityIndicatorView.hidden = true;
}

-(void) getChannelInfo {
    NSArray* services= @[[CPServiceInfo buildWithType:ServiceTypeSms push:YES],[CPServiceInfo buildWithType:ServiceTypeChat push:true],[CPServiceInfo buildWithType:ServiceTypeCall push:true],[CPServiceInfo buildWithType:ServiceTypeAddressbook push:true],[CPServiceInfo buildWithType:ServiceTypePresence push:true]];
    self.CPaaS = [[CPaaS alloc] initWithServices: services];
    [self.CPaaS.authenticationService connectWithIdToken:self.idToken accessToken:self.accessToken lifetime:3600 completion:^(CPError * _Nullable error, NSString * _Nullable channelInfo) {
        if (error) {
            NSString *errStr = [NSString stringWithFormat:@"%@", error.localizedDescription];
            NSLog(@"Error %@",errStr);
        } else {
            NSLog(@"Channel info %@",channelInfo);
            self.channelInfo = channelInfo;
            if(channelInfo) {
                self.channelInfoTextView.text = self.channelInfo;
                [self.activityIndicatorView stopAnimating];
                self.activityIndicatorView.hidden = true;
            }
        }
    }];
}

- (IBAction)pushToServiceController  {
    UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Call_Controller *callController = [storyboard instantiateViewControllerWithIdentifier:@"call_controller"];
    callController.cpaas = self.CPaaS;
    [self.navigationController pushViewController: callController animated:YES];
}

@end


