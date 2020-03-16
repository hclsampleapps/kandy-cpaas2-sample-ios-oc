
#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AddressListViewController.h"
#import "DirectoryViewController.h"
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface AddressDirectoryViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentControl;
@property (nonatomic, weak) IBOutlet UIView *containerView;

@property(strong, nonatomic) CPaaS* cpaas;

- (IBAction)segmentValueChanged:(id)sender;

@end

NS_ASSUME_NONNULL_END
