
#import <UIKit/UIKit.h>
#import "kandy_cpaas2_sample_ios_oc-Swift.h"

@import CPaaSSDK;
@class LynnBubbleTableView;

NS_ASSUME_NONNULL_BEGIN

@interface GroupChatDetailsViewController : UIViewController

@property(strong, nonatomic) NSString* groupId;
@property(strong, nonatomic) CPaaS* cpaas;
@property (weak, nonatomic) IBOutlet LynnBubbleTableView *tbBubbleDemo;

@end


NS_ASSUME_NONNULL_END
