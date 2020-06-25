
#import "SMS_Controller.h"
@import CPaaSSDK;

@interface SMS_Controller ()

@end

@implementation SMS_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initServices];
    // Do any additional setup after loading the view.
}

- (void) initServices {
    self.cpaas.smsService.delegate = self;
    [self sendSMS];
}

//SMS Delegate

- (void)deliveryStatusChangedWithStatus:(CPMessageStatus * _Nonnull)status {
    NSLog(@"Message Status %@",status);
}

- (void)inboundMessageReceivedWithMessage:(CPInboundMessage * _Nonnull)message {
    NSLog(@"Message Recived%@",message);
}

- (void)outboundMessageSentWithMessage:(CPOutboundMessage * _Nonnull)message {
    NSLog(@"Message Send%@",message);
}

-(void) sendSMS{
    NSString* source = @"+15205829010";
    NSString* destination = @"+12522327784";
    CPConversation* conversation = [self.cpaas.smsService createConversationFromAddress:source withParticipant:destination];
    [conversation sendWithText:@"test" :^(CPError * _Nullable error, CPOutboundMessage * _Nullable newMessage) {
        if (error != nil) {
            NSLog(@"Error desciption %@",error.description);
        } else {
            NSLog(@"SMS message sent to %@!", destination);
        }
    }];
}

@end
