
#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface DashboardViewController : BaseViewController

@property(nonatomic , weak) IBOutlet UICollectionView *collectionVw;

@property(strong, nonatomic) CPaaS* cpaas;

@end

NS_ASSUME_NONNULL_END
