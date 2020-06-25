
#import "Call_Controller.h"

@interface Call_Controller ()

@end

@implementation Call_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarColorForViewController:self ofType:0 withTitleString:@"Dashboard"];
    [self initServices];
    // Do any additional setup after loading the view.
}

- (void) initServices {
    [self.cpaas.callService setCallApplicationDelegate:self];
    [self placeOutGoingCall];
}

//Outgoing Call
-(void) placeOutGoingCall {
    CPUriAddress *term = [[CPUriAddress alloc] initWithUsername:@"test" withDomain:@"domain"];
    CPCallService *service = _cpaas.callService;
    [service createOutGoingCall:self andTerminator:term completion:^(id<CPOutgoingCallDelegate> call, CPError * error) {
        if (error) {
            NSLog(@"Call Couldn't be created - Error: %@", error.localizedDescription);
            return;
        }
        [call establishCall:NO];
    }];
}

//Incoming Call
- (void)incomingCall:(id<CPIncomingCallDelegate>)call {
    [call acceptCall:NO];
        //[call rejectCall];
}

- (void)callStatusChanged:(id<CPCallDelegate>)call withState:(CPCallState *)callState {
    NSLog(@"Call Status changed to :%ld", (long)callState.type);
}


@end
