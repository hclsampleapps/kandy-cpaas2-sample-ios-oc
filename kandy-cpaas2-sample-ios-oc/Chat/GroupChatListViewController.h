
#import <UIKit/UIKit.h>

@import CPaaSSDK;


NS_ASSUME_NONNULL_BEGIN

@interface GroupChatListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,CPChatDelegate>
{
    
    
}

@property(nonatomic , weak) IBOutlet UITableView *groupListTable;

@property(strong, nonatomic) CPaaS* cpaas;
@property(strong, nonatomic) NSArray<CPChatGroup*>* groupChatList;

@end

NS_ASSUME_NONNULL_END
