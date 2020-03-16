
#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@import CPUtilities;
@import CPaaSSDK;
@import CPAuthenticationService;

@interface LoginViewController : BaseViewController

@property(strong, nonatomic) NSString *accessToken;
@property(strong, nonatomic) NSString *idToken;
@property(strong, nonatomic) NSString *refreshToken;
@property(strong, nonatomic) NSString *channelInfo;

@property(strong, nonatomic) CPaaS *CPaaS;

@property (nonatomic, weak) IBOutlet UITextField *clienId;
@property (nonatomic, weak) IBOutlet UITextField *baseUrl_Field;
@property (nonatomic, weak) IBOutlet UITextField *username;
@property (nonatomic, weak) IBOutlet UITextField *password;
//@property (nonatomic, weak) IBOutlet UITextView *accessTokenTextView;
//@property (nonatomic, weak) IBOutlet UITextView *channelInfoTextView;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView* activityIndicatorView;

@property(nonatomic, weak) IBOutlet UIView *container_View;
@property(nonatomic, weak) IBOutlet UIScrollView *scrollVw;
@property(nonatomic, weak) IBOutlet UIView *clientId_View;
@property(nonatomic, weak) IBOutlet UIView *email_View;
@property(nonatomic, weak) IBOutlet UIView *password_View;
@property(nonatomic, weak) IBOutlet UIView *baseUrl_View;

@end



