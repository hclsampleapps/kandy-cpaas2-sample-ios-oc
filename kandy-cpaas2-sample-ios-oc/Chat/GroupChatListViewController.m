
#import "GroupChatListViewController.h"
#import "CustomeCellTableViewCell.h"
#import "GroupChatDetailsViewController.h"

@interface GroupChatListViewController ()

@end

@implementation GroupChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initServices];
    [self getGrouoList];
    // Do any additional setup after loading the view from its nib.
}

- (void) initServices {
    [self.cpaas.chatService setDelegate:self];
}

-(void) getGrouoList {
    [self.cpaas.chatService fetchAllChatGroupsWithCompletion:^(CPError *error, NSArray<CPChatGroup*>* list) {
        if(error == nil) {
            self.groupChatList = list;
            dispatch_async(dispatch_get_main_queue(),
            ^{ [self.groupListTable reloadData];
            });
        } else {
            
        }
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
       UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];

       if(cell == nil)
       {
           cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
       }
       CPChatGroup *currentChatGroup = (CPChatGroup*)self.groupChatList[indexPath.row];
       cell.textLabel.text = currentChatGroup.name;
       return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CPChatGroup *currentChatGroup = (CPChatGroup*)self.groupChatList[indexPath.row];
    GroupChatDetailsViewController *vc = [[GroupChatDetailsViewController alloc]initWithNibName:@"GroupChatDetailsViewController" bundle:nil];
     vc.cpaas = self.cpaas;
     vc.groupId = currentChatGroup.groupID;
     [self.navigationController pushViewController:vc animated:YES];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.groupChatList.count > 0) {
        return  self.groupChatList.count;
    } else {
        return  0;
    }
}

- (void)deliveryStatusChangedWithStatus:(CPMessageStatus * _Nonnull)status {
    
}

- (void)groupChatEndedWithGroupID:(NSString * _Nonnull)groupID {
    
}

- (void)groupInvitationReceivedWithInvitation:(CPChatGroupInvitation * _Nonnull)invitation {
    
}

- (void)groupParticipantStatusWithParticipants:(NSArray<CPChatGroupParticipant *> * _Nonnull)participants {
    
}

- (void)inboundMessageReceivedWithMessage:(CPInboundMessage * _Nonnull)message {
    
}

- (void)isComposingWithMessage:(CPIsComposingMessage * _Nonnull)message {
    
}

- (void)outboundMessageSentWithMessage:(CPOutboundMessage * _Nonnull)message {
    
}


@end
