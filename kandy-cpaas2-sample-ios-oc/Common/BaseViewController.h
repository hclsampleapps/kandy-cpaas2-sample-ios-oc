
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

-(void)setNavigationBarColorForViewController : (UIViewController*)viewController ofType : (NSInteger)type withTitleString : (NSString*)titleString;
    
@end

NS_ASSUME_NONNULL_END
