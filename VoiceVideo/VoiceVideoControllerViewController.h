
#import "BaseViewController.h"
#import "VoiceVideoControllerViewController.h"

@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface VoiceVideoControllerViewController : BaseViewController <CPCallApplicationDelegate>
{

}

@property (weak, nonatomic) IBOutlet UIView *localVideoViewHandler;
@property (weak, nonatomic) IBOutlet UIView *remoteVideoViewHandler;
@property (weak, nonatomic) IBOutlet UITextField *userIdField;

- (IBAction)endCall:(id)sender;
- (IBAction)startCall:(id)sender;

@property(strong, nonatomic) CPaaS* cpaas;

- (id<CPIncomingCallDelegate>)getCurrentCall;


@end

NS_ASSUME_NONNULL_END

