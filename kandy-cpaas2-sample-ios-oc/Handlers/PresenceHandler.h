
#import <Foundation/Foundation.h>
@import CPaaSSDK;

@protocol PresenceDelegate <NSObject>
-(void)updateUserStatus:(NSString* _Nullable)status;
-(void)listOfPresenties:(CPPresentityList*_Nullable)list;
-(void)updateUserStatusColor:(NSString*_Nullable)status;
@end

NS_ASSUME_NONNULL_BEGIN

@interface PresenceHandler : NSObject<CPPresenceDelegate>
{
    CPPresentityList *presentityLst;
    NSArray *contact;
}
@property(nonatomic,weak) id<PresenceDelegate> delegate;
@property(nonatomic,strong) CPaaS *cpaas;
//@property(nonatomic,strong) NSString *destinationNumber;

+(instancetype)sharedInstance;
-(CPAuthenticationService*)authentication;
-(void)subscribeServices;
-(void)fetchAllPrentities;
-(void)updateStatus:(NSString*)statusToUpdate;
@end

NS_ASSUME_NONNULL_END
