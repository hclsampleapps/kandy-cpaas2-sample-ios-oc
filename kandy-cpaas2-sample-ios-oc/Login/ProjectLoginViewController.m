
#import "ProjectLoginViewController.h"
#import "Call_Controller.h"
#import "DashboardViewController.h"

#define grantType @"client_credentials"
#define scopeId @"openid regular_call"
#define serverUrl @"https://oauth-cpaas.att.com/cpaas/auth/v1/token"
@interface ProjectLoginViewController ()

@end

@implementation ProjectLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _privateprojectkey_Field.text = @"abcde123-12a1-1a23-1234-123a12345a1a";
    _baseUrl_Field.text = @"oauth-cpaas.att.com";
    _privateprojectsecret_Field.text =  @"123abcde-a123-1234-abcd-ab12345c67d8";
    [self setNavigationBarColorForViewController:self ofType:0 withTitleString:@"Client Credentials"];
    [self changeViewLayout];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden: NO];
}

- (IBAction)login {
    [self getToken];
}

-(void) getToken {
    if(self.privateprojectkey_Field.text.length > 0 && self.privateprojectsecret_Field.text.length > 0  && self.baseUrl_Field.text.length > 0) {
       // self.activityIndicatorView.hidden = false;
       // [self.activityIndicatorView startAnimating];
        [self sendingAnHTTPPOSTRequestOniOSWithClientProjectKey:self.privateprojectkey_Field.text andClientProjectSecret:self.privateprojectsecret_Field.text grant_type:grantType scope:scopeId];
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
    
    _privateprojectkey_View.layer.cornerRadius = 4.0;
    _privateprojectkey_View.layer.borderColor = UIColor.grayColor.CGColor;
    _privateprojectkey_View.layer.borderWidth = 0.8;
    
    _privateprojectsecret_View.layer.cornerRadius = 4.0;
    _privateprojectsecret_View.layer.borderColor = UIColor.grayColor.CGColor;
    _privateprojectsecret_View.layer.borderWidth = 0.8;
    
    _baseUrl_View.layer.cornerRadius = 4.0;
    _baseUrl_View.layer.borderColor = UIColor.grayColor.CGColor;
    _baseUrl_View.layer.borderWidth = 0.8;
}

-(void)sendingAnHTTPPOSTRequestOniOSWithClientProjectKey: (NSString *)projectKey  andClientProjectSecret:(NSString *)projectSecret grant_type: (NSString *)grant_type scope:(NSString *)scope{
    //Init the NSURLSession with a configuration
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    //Create an URLRequest
    NSURL *url = [NSURL URLWithString:serverUrl];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    //Create POST Params and add it to HTTPBody
    NSString *params = [NSString stringWithFormat:@"client_id=%@&client_secret=%@&grant_type=%@&scope=%@",projectKey,projectSecret,grant_type,scope];
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    [urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //Create task
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //Handle your response here
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if([responseDict valueForKey:@"error"] == nil)
        {
        self.accessToken = [responseDict objectForKey:@"access_token"];
        self.idToken = [responseDict objectForKey:@"id_token"];
        self.refreshToken = [responseDict objectForKey:@"refresh_token"];
        if(self.accessToken) {
            [self getChannelInfo];
        }
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please check the credentials." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:YES
                                          completion:nil];
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    [dataTask resume];
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
                // self.channelInfoTextView.text = self.channelInfo;
               // [self.activityIndicatorView stopAnimating];
               // self.activityIndicatorView.hidden = true;
                [self navigateToDashboard];
            }
        }
    }];
}

- (void)navigateToDashboard  {
    /*UIStoryboard *storyboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Call_Controller *callController = [storyboard instantiateViewControllerWithIdentifier:@"call_controller"];
    callController.cpaas = self.CPaaS;
    [self.navigationController pushViewController: callController animated:YES];
    [self.tabBarController.tabBar setHidden: YES];*/
    
    DashboardViewController *vc = [[DashboardViewController alloc]initWithNibName:@"DashboardViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.cpaas = self.CPaaS;
    [[UIApplication sharedApplication] delegate].window.rootViewController = navigationController;}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
