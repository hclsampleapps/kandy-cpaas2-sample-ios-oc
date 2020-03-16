
#import <UIKit/UIKit.h>
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface Chat_Controller : UIViewController <CPChatDelegate>

@property(strong, nonatomic) CPaaS* cpaasObject;

@end

NS_ASSUME_NONNULL_END
