
#import <Foundation/Foundation.h>
@import CPaaSSDK;
NS_ASSUME_NONNULL_BEGIN

@protocol ChatDelegate <NSObject>
-(void)inboundMessageReceived:(NSString*)message senderNumber:(NSString*)number;
-(void)outboundMessageSent;
-(void)deliveryStatusChanged;
-(void)sendMessagewithSuccess:(BOOL)isSuccess;
@end

@interface ChatHandler : NSObject<CPChatDelegate>

@property(nonatomic,weak) id<ChatDelegate> delegate;
@property(nonatomic,strong) CPaaS *cpaas;
@property(nonatomic,strong) NSString *destinationNumber;

+(instancetype)sharedInstance;
-(CPAuthenticationService*)authentication;
-(void)subscribeServices;
-(void)sendMessage:(NSString*)message;
@end

NS_ASSUME_NONNULL_END
