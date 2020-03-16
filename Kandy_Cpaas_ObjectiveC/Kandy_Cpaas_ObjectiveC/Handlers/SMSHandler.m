//
//  SMSHandler.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 1/8/20.
//  Copyright © 2020 hcl. All rights reserved.
//

#import "SMSHandler.h"

@implementation SMSHandler

+ (instancetype)sharedInstance
{
    static SMSHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SMSHandler alloc] init];
    });
    return sharedInstance;
}
- (CPAuthenticationService *)authentication{
    return _cpaas.authenticationService;
}

-(void)subscribeServices{
    self.cpaas.smsService.delegate = self;
}

- (void)deliveryStatusChangedWithStatus:(CPMessageStatus * _Nonnull)status { 
    if ([self.delegate conformsToProtocol:@protocol(SMSDelegate)] && [self.delegate respondsToSelector:@selector(deliveryStatusChanged)] ) {
        [self.delegate deliveryStatusChanged];
    }
}

- (void)inboundMessageReceivedWithMessage:(CPInboundMessage * _Nonnull)message { 
    if ([self.delegate conformsToProtocol:@protocol(SMSDelegate)] && [self.delegate respondsToSelector:@selector(inboundMessageReceived:senderNumber:)] ) {
        [self.delegate inboundMessageReceived:[[message.parts objectAtIndex:0] valueForKey:@"text"] senderNumber:message.sender];
    }
}

- (void)outboundMessageSentWithMessage:(CPOutboundMessage * _Nonnull)message { 
    if ([self.delegate conformsToProtocol:@protocol(SMSDelegate)] && [self.delegate respondsToSelector:@selector(outboundMessageSent)] ) {
        [self.delegate outboundMessageSent];
    }
}

-(void)sendMessage:(NSString*)message{
    CPConversation *conversation = [self.cpaas.smsService createConversationFromAddress:self.sourceNumber withParticipant:self.destinationNumber];
    CPMessage *msg = [self.cpaas.smsService createMessageWithText:message];
    if (conversation){
        [conversation sendWithMessage:msg :^(CPError * error, CPOutboundMessage * mewMessage) {
            if (error != nil) {
                NSLog(@"ChatServices send failed destination %@",self.destinationNumber);
                if ([self.delegate conformsToProtocol:@protocol(SMSDelegate)] && [self.delegate respondsToSelector:@selector(sendMessagewithSuccess:)] ) {
                    [self.delegate sendMessagewithSuccess:NO];
                }
            }
            else{
                if ([self.delegate conformsToProtocol:@protocol(SMSDelegate)] && [self.delegate respondsToSelector:@selector(sendMessagewithSuccess:)] ) {
                    [self.delegate sendMessagewithSuccess:YES];
                }
            }
        }];
    }
    else{
        if ([self.delegate conformsToProtocol:@protocol(SMSDelegate)] && [self.delegate respondsToSelector:@selector(sendMessagewithSuccess:)] ) {
            [self.delegate sendMessagewithSuccess:NO];
        }
    }
}

@end
