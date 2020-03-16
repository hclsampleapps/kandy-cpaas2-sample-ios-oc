
#import "BaseViewController.h"

@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@interface DirectoryViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UISearchBar    *searchBar;
@property (nonatomic, weak) IBOutlet UITableView    *tblVw_Directory;
@property (nonatomic, weak) IBOutlet UIButton       *btn_Name;
@property (nonatomic, weak) IBOutlet UIButton       *btn_FirstName;
@property (nonatomic, weak) IBOutlet UIButton       *btn_LastName;
@property (nonatomic, weak) IBOutlet UIButton       *btn_PhoneNum;
@property (nonatomic, weak) IBOutlet UIView         *viewDirectory;
- (IBAction)btnFilterTappedWithSender:(UIButton*)sender;


@property(strong, nonatomic) CPaaS* cpaas;

@end

NS_ASSUME_NONNULL_END
