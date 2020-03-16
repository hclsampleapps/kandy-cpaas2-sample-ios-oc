
#import <UIKit/UIKit.h>
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface SMS_Controller : UIViewController  <CPSmsDelegate>

@property(strong, nonatomic) CPaaS* cpaas;

@end

NS_ASSUME_NONNULL_END
