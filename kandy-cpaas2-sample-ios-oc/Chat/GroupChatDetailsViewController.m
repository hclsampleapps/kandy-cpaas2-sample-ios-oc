
#import "GroupChatDetailsViewController.h"

@interface GroupChatDetailsViewController () <LynnBubbleViewDataSource>
{
    LynnUserData *userMe;
    LynnUserData *userSomeone;
    NSMutableArray *arrChatTest;
}
@end

@implementation GroupChatDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getGroupChatHistory];
    _tbBubbleDemo.bubbleDataSource = self;
    userMe  = [[LynnUserData alloc] initWithUserUniqueId:@"123" userNickName:@"" userProfileImage:nil additionalInfo:nil];
    userSomeone = [[LynnUserData alloc] initWithUserUniqueId:@"234" userNickName:@"" userProfileImage:[UIImage imageNamed:@"ico_girlprofile"] additionalInfo:nil];
    arrChatTest = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
}

-(void) getGroupChatHistory {
    [self.cpaas.chatService fetchConversationWithGroupID:self.groupId completion:^(CPError * error, FetchResult * results) {
        if(results != nil) {
            for (CPConversation* conversation in results.result) {
                [conversation fetchMessagesWithCompletion:^(CPError * error, FetchResult * results) {
                    for (CPMessage* message in results.result) {
                        //Add [user@domain] of the user logged in
                        if([message.sender isEqualToString:@"user@domain"]) {
                            LynnBubbleData *bubbleData = [[LynnBubbleData alloc] initWithUserData:self->userSomeone dataOwner:BubbleDataTypeSomeone message:message.text messageDate:[NSDate date] attachedImage:nil];
                            [self->arrChatTest addObject:bubbleData];
                            [self->_tbBubbleDemo reloadData];
                        } else {
                            LynnBubbleData *bubbleData = [[LynnBubbleData alloc] initWithUserData:self->userMe dataOwner:BubbleDataTypeMe message:message.text messageDate:[NSDate date] attachedImage:nil];
                            [self->arrChatTest addObject:bubbleData];
                            [self->_tbBubbleDemo reloadData];
                        }
                    }
                }];
            }
        } else {
            
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (LynnBubbleData * _Nonnull)bubbleTableViewWithDataAt:(NSInteger)index bubbleTableView:(LynnBubbleTableView * _Nonnull)bubbleTableView {
    return arrChatTest[index];
}

- (NSInteger)bubbleTableViewWithNumberOfRows:(LynnBubbleTableView * _Nonnull)bubbleTableView {
    return arrChatTest.count;
}

@end
