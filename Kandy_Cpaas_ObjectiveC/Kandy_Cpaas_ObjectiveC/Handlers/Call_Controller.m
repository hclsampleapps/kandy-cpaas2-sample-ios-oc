//
//  Call_Controller.m
//  Test_IOS_Project
//
//  Created by Viviksha on 26/09/19.
//  Copyright © 2019 Ribbon. All rights reserved.
//

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
    [self.cpaas.callService setCallApplication:self];
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

- (void)consultativeTransfer:(id<CPCallDelegate> _Nonnull)call {
 
}

- (void)endCall {
    
}

- (void)holdCall {
    
}

- (void)mute {
    
}

- (void)setCaptureDevice:(AVCaptureDevicePosition)position withVideoResolution:(nonnull NSString *)videoResolution completionHandler:(void (^ _Nullable)(CPError * _Nullable))handler {
    
}

- (void)transferCall:(CPUriAddress * _Nonnull)newAddress {
    
}

- (void)unHoldCall {
    
}

- (void)unMute {
    
}

- (void)videoStart {
    
}

- (void)videoStop {
    
}

@end
