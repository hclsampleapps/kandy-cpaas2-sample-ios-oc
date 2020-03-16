//
//  SMSHandler.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 1/8/20.
//  Copyright © 2020 hcl. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CPaaSSDK;
@protocol SMSDelegate <NSObject>
-(void)inboundMessageReceived:(NSString*_Nullable)message senderNumber:(NSString*_Nullable)number;
-(void)outboundMessageSent;
-(void)deliveryStatusChanged;
-(void)sendMessagewithSuccess:(BOOL)isSuccess;
@end

NS_ASSUME_NONNULL_BEGIN

@interface SMSHandler : NSObject<CPSmsDelegate>

@property(nonatomic,weak) id<SMSDelegate> delegate;
@property(nonatomic,strong) CPaaS *cpaas;
@property(nonatomic,strong) NSString *sourceNumber;
@property(nonatomic,strong) NSString *destinationNumber;

+(instancetype)sharedInstance;
-(CPAuthenticationService*)authentication;
-(void)subscribeServices;
-(void)sendMessage:(NSString*)message;
@end

NS_ASSUME_NONNULL_END
