
#import "VoiceVideoControllerViewController.h"

@interface VoiceVideoControllerViewController ()


@end

@implementation VoiceVideoControllerViewController

id<CPOutgoingCallDelegate> currentOutgoingcall;
id<CPIncomingCallDelegate> currentIncomingCall;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarColorForViewController:self ofType:0 withTitleString:@"Call"];
    [self initServices];
    // Do any additional setup after loading the view from its nib.
}

- (void) initServices {
    [self.cpaas.callService setCallApplicationDelegate:self];
}

//Outgoing Call
-(void) placeOutGoingCall {
    CPUriAddress *term = [[CPUriAddress alloc] initWithUsername:@"user" withDomain:@"domain"];
    CPCallService *service = self.cpaas.callService;
    [service createOutGoingCall:self andTerminator:term completion:^(id<CPOutgoingCallDelegate> call, CPError * error) {
        if (error) {
            NSLog(@"Call Couldn't be created - Error: %@", error.localizedDescription);
            return;
        } else {
            currentOutgoingcall = call;
            call.localVideoView = self.localVideoViewHandler;
            call.remoteVideoView = self.remoteVideoViewHandler;
            [call establishCall:YES];
        }
    }];
}

- (id<CPOutgoingCallDelegate>)getCurrentOutGoingCall {
    return currentOutgoingcall;
}


- (id<CPIncomingCallDelegate>)getCurrentIncomingCall {
    return currentIncomingCall;
}

- (IBAction)startCall:(id)sender{
    [self placeOutGoingCall];
}

- (IBAction)endCall:(id)sender{
    if(currentOutgoingcall != nil) {
        [self.getCurrentOutGoingCall endCall];
        currentOutgoingcall  = nil;
    }
    
    if(currentIncomingCall != nil) {
        [self.getCurrentIncomingCall endCall];
        currentIncomingCall  = nil;
    }
    
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
    currentIncomingCall = call;
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
