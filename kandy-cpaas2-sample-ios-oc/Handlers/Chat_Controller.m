
#import "Chat_Controller.h"
@import CPaaSSDK;

@interface Chat_Controller ()

@end

@implementation Chat_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initServicesChat];
    // Do any additional setup after loading the view.
}

- (void) initServicesChat {
    self.cpaasObject.chatService.delegate = self;
    [self sendChat];
}

- (void)deliveryStatusChangedWithStatus:(CPMessageStatus * _Nonnull)status {
    NSLog(@"Message Status %@",status);
}

- (void)inboundMessageReceivedWithMessage:(CPInboundMessage * _Nonnull)message {
    NSLog(@"Message %@",message);
}

-(void) sendChat{
    NSString* destination = @"nesonukuv1@nesonukuv.34mv.att.com";
    CPConversation* conversation = [self.cpaasObject.chatService  createConversationWithParticipant:destination];
    [conversation sendWithText:@"Hello world" :
     ^(CPError * _Nullable error, CPOutboundMessage * _Nullable newMessage){
         if (error != nil) {
             NSLog(@"ChatService.send failed. destination %@. Error desc:%@", destination , error.description);
         } else {
             NSLog(@"Chat message sent to %@!", destination);
             // save message to application model
         }
     }
     ];
}

@end
