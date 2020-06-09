
#import "LoginViewController.h"
#import "SMS_Controller.h"
#import "Call_Controller.h"
#import "DashboardViewController.h"

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
    _baseUrl_Field.text = @"oauth-cpaas.att.com";
    // Do any additional setup after loading the view, typically from a nib.
    [self setConfiguration];
    [self changeViewLayout];
    [self setNavigationBarColorForViewController:self ofType:0 withTitleString:@"Grant Password"];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden: NO];
    
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
    if(self.password.text.length > 0 && self.password.text.length > 0 && self.clienId.text.length > 0 && self.baseUrl_Field.text.length > 0) {
        self.activityIndicatorView.hidden = false;
        [self.activityIndicatorView startAnimating];
        [self sendingAnHTTPPOSTRequestOniOSWithUserEmailId:self.username.text withPassword:self.password.text clientId:self.clienId.text grant_type:grantType scope:scopeId];
        [self.view setUserInteractionEnabled:NO];
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


-(void) changeViewLayout {
    _email_View.layer.cornerRadius = 4.0;
    _email_View.layer.borderColor = UIColor.grayColor.CGColor;
    _email_View.layer.borderWidth = 0.8;
    
    _password_View.layer.cornerRadius = 4.0;
    _password_View.layer.borderColor = UIColor.grayColor.CGColor;
    _password_View.layer.borderWidth = 0.8;
    
    _clientId_View.layer.cornerRadius = 4.0;
    _clientId_View.layer.borderColor = UIColor.grayColor.CGColor;
    _clientId_View.layer.borderWidth = 0.8;
    
    _baseUrl_View.layer.cornerRadius = 4.0;
    _baseUrl_View.layer.borderColor = UIColor.grayColor.CGColor;
    _baseUrl_View.layer.borderWidth = 0.8;
    
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
        NSString *err = [responseDict objectForKey:@"error"];
        if (err.length> 0)
        {
            [self.activityIndicatorView stopAnimating];
             self.activityIndicatorView.hidden = true;
            [self.view setUserInteractionEnabled:YES];
        }
        
        self.accessToken = [responseDict objectForKey:@"access_token"];
        self.idToken = [responseDict objectForKey:@"id_token"];
        self.refreshToken = [responseDict objectForKey:@"refresh_token"];
        if(self.accessToken) {
           // self.accessTokenTextView.text = self.accessToken;
            [self getChannelInfo];
        }
    }];
    [dataTask resume];
}

-(void) setConfiguration {
    CPConfig *configuration = [CPConfig sharedInstance];
    configuration.restServerUrl = @"oauth-cpaas.att.com";
    configuration.useSecureConnection = YES;
    CPICEServers *iceServers = [[CPICEServers alloc] init];
    [iceServers addICEServer:@"turns:turn-ucc-1.genband.com:443?transport=tcp"];
    [iceServers addICEServer:@"turns:turn-ucc-2.genband.com:443?transport=tcp"];
    [iceServers addICEServer:@"stun:turn-ucc-1.genband.com:3478?transport=udp"];
    [iceServers addICEServer:@"stun:turn-ucc-2.genband.com:3478?transport=udp"];
    [configuration setICEServers:iceServers];
    [configuration.logManager setLogLevel:TRACE_WEBRTC];
    self.activityIndicatorView.hidden = true;
}

-(void) getChannelInfo {
    NSArray* services= @[[CPServiceInfo buildWithType:ServiceTypeSms push:YES],[CPServiceInfo buildWithType:ServiceTypeChat push:true],[CPServiceInfo buildWithType:ServiceTypeCall push:true],[CPServiceInfo buildWithType:ServiceTypeAddressbook push:true],[CPServiceInfo buildWithType:ServiceTypePresence push:true]];
    self.CPaaS = [[CPaaS alloc] initWithServices: services];
   // [self navigateToDashboard];
    [self.CPaaS.authenticationService connectWithIdToken:self.idToken accessToken:self.accessToken lifetime:3600 completion:^(CPError * _Nullable error, NSString * _Nullable channelInfo) {
        if (error) {
            NSString *errStr = [NSString stringWithFormat:@"%@", error.localizedDescription];
            NSLog(@"Error %@",errStr);
        }
        else {
            NSLog(@"Channel info %@",channelInfo);
            self.channelInfo = channelInfo;
            if(channelInfo) {
               // self.channelInfoTextView.text = self.channelInfo;
                [self.activityIndicatorView stopAnimating];
                self.activityIndicatorView.hidden = true;
                [self navigateToDashboard];
                 [self.view setUserInteractionEnabled:YES];            }
        }
        [self navigateToDashboard];
    }];
    
    
}

- (void)navigateToDashboard  {
    DashboardViewController *vc = [[DashboardViewController alloc]initWithNibName:@"DashboardViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.cpaas = self.CPaaS;
    [[UIApplication sharedApplication] delegate].window.rootViewController = navigationController;
}

@end


