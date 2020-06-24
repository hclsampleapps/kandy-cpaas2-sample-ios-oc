
#import "VoiceVideoControllerViewController.h"

@interface VoiceVideoControllerViewController ()

@end

@implementation VoiceVideoControllerViewController

id<CPIncomingCallDelegate>currentCall;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarColorForViewController:self ofType:0 withTitleString:@"Dashboard"];
    [self initServices];
    [self.userIdField setText:@"nesonukuv1@nesonukuv.34mv.att.com"];
    // Do any additional setup after loading the view from its nib.
}

- (void) initServices {
    [self.cpaas.callService setCallApplicationDelegate:self];
   // [self placeOutGoingCall];
}

//Outgoing Call
-(void) placeOutGoingCall {
    CPUriAddress *term = [[CPUriAddress alloc] initWithUsername:@"nesonukuv1" withDomain:@"nesonukuv.34mv.att.com"];
    CPCallService *service = self.cpaas.callService;
    [service createOutGoingCall:self andTerminator:term completion:^(id<CPOutgoingCallDelegate> call, CPError * error) {
        if (error) {
            NSLog(@"Call Couldn't be created - Error: %@", error.localizedDescription);
            return;
        } else {
            call.localVideoView = self.localVideoViewHandler;
            call.remoteVideoView = self.remoteVideoViewHandler;
            [call establishCall:YES];
        }
    }];
}

- (IBAction)startCall:(id)sender{
    [self placeOutGoingCall];
}

- (IBAction)endCall:(id)sender{
    [self.getCurrentCall endCall];
    [self.navigationController popViewControllerAnimated:true];
}

- (id<CPIncomingCallDelegate>)getCurrentCall {
    return currentCall;
}

- (void)acceptCallFailed:(nonnull id<CPIncomingCallDelegate>)call withError:(nonnull CPError *)error{
    
}

- (void)acceptCallSucceed:(nonnull id<CPIncomingCallDelegate>)call {
    
}

- (void)callAdditionalInfoChanged:(nonnull id<CPCallDelegate>)call withDictionary:(nonnull NSDictionary *)detailedInfo {
    
}

- (void)callStatusChanged:(nonnull id<CPCallDelegate>)call withState:(nonnull CPCallState *)callState {
    
}

- (void)endCallFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)endCallSucceeded:(nonnull id<CPCallDelegate>)call {
    
}

- (void)establishCallFailed:(nonnull id<CPOutgoingCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)establishCallSucceeded:(nonnull id<CPOutgoingCallDelegate>)call {
    
}

- (void)forwardCallFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)forwardCallSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)holdCallFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)holdCallSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)ignoreFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)ignoreSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)incomingCall:(nonnull id<CPIncomingCallDelegate>)call {
    [call acceptCall:true];
    call.localVideoView = self.localVideoViewHandler;
    call.remoteVideoView = self.remoteVideoViewHandler;
}

- (void)mediaAttributesChanged:(nonnull id<CPCallDelegate>)call withMediaAttributes:(nonnull CPMediaAttributes *)mediaAttributes {
    
}

- (void)muteCallFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)muteCallSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)rejectCallFailed:(nonnull id<CPIncomingCallDelegate>)call withError:(nonnull CPError *)error{
    
}

- (void)rejectCallSuccedded:(nonnull id<CPIncomingCallDelegate>)call {
    
}

- (void)transferCallFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)transferCallSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)unHoldCallFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)unHoldCallSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)unMuteCallFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)unMuteCallSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)videoStartFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)videoStartSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)videoStopFailed:(nonnull id<CPCallDelegate>)call withError:(nonnull CPError *)error {
    
}

- (void)videoStopSucceed:(nonnull id<CPCallDelegate>)call {
    
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (void)updateFocusIfNeeded {
    
}

@end
