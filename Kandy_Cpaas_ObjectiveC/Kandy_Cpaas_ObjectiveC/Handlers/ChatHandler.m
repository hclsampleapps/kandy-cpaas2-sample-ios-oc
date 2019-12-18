//
//  ChatHandler.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 12/6/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "ChatHandler.h"

@implementation ChatHandler

+ (instancetype)sharedInstance
{
    static ChatHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ChatHandler alloc] init];
    });
    return sharedInstance;
}
- (CPAuthenticationService *)authentication{
    return _cpaas.authenticationService;
}

-(void)inboundMessageReceivedWithMessage:(CPInboundMessage *)message{
    if ([self.delegate conformsToProtocol:@protocol(ChatDelegate)] && [self.delegate respondsToSelector:@selector(inboundMessageReceived:senderNumber:)] ) {
        [self.delegate inboundMessageReceived:[[message.parts objectAtIndex:0] valueForKey:@"text"] senderNumber:message.sender];
       //message.parts[0].value(forKey: "text")
        
    }
        
}

- (void)deliveryStatusChangedWithStatus:(CPMessageStatus * _Nonnull)status { 
    if ([self.delegate conformsToProtocol:@protocol(ChatDelegate)] && [self.delegate respondsToSelector:@selector(deliveryStatusChanged)] ) {
        [self.delegate deliveryStatusChanged];
    }
    
}


- (void)groupChatEndedWithGroupID:(NSString * _Nonnull)groupID { 
    NSLog(@"%@", groupID);
}


- (void)groupInvitationReceivedWithInvitation:(CPChatGroupInvitation * _Nonnull)invitation { 
    NSLog(@"%@", invitation);
}


- (void)groupParticipantStatusWithParticipants:(NSArray<CPChatGroupParticipant *> * _Nonnull)participants { 
    NSLog(@"%@", participants);
}


- (void)isComposingWithMessage:(CPIsComposingMessage * _Nonnull)message { 
    NSLog(@"%@", message);
}


- (void)outboundMessageSentWithMessage:(CPOutboundMessage * _Nonnull)message {
    if ([self.delegate conformsToProtocol:@protocol(ChatDelegate)] && [self.delegate respondsToSelector:@selector(deliveryStatusChanged)] ) {
        [self.delegate deliveryStatusChanged];
    }
}

-(void)subscribeServices{
    self.cpaas.chatService.delegate = self;
}
-(void)sendMessage:(NSString*)message{
    CPConversation *conversation = [self.cpaas.chatService createConversationWithParticipant:self.destinationNumber];
    if (conversation){
       [ conversation sendWithText:message :^(CPError * error , CPOutboundMessage * newMessage) {
            if (error != nil) {
                NSLog(@"ChatServices send failed destination %@",self.destinationNumber);
                if ([self.delegate conformsToProtocol:@protocol(ChatDelegate)] && [self.delegate respondsToSelector:@selector(sendMessagewithSuccess:)] ) {
                    [self.delegate sendMessagewithSuccess:NO];
                }
            }
            else{
                if ([self.delegate conformsToProtocol:@protocol(ChatDelegate)] && [self.delegate respondsToSelector:@selector(sendMessagewithSuccess:)] ) {
                    [self.delegate sendMessagewithSuccess:YES];
                }
            }
       }];
    }
    else{
        if ([self.delegate conformsToProtocol:@protocol(ChatDelegate)] && [self.delegate respondsToSelector:@selector(sendMessagewithSuccess:)] ) {
            [self.delegate sendMessagewithSuccess:NO];
            }
    }
}

-(void)fetchConversation{
    [self.cpaas.chatService fetchConversationsWithCompletion:^(CPError * error, FetchResult * conversations) {
        if (error == nil) {
            NSLog(@"%@", conversations);
        }
        else{
            NSLog(@"Could not fetch conversations");
        }
            
    }];
}


@end
