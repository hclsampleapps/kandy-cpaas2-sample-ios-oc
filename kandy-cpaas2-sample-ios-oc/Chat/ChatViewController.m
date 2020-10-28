
#import "ChatViewController.h"


@interface ChatViewController () <ChatDelegate,LynnBubbleViewDataSource>
{
    ChatHandler *chatHandler;
    NSMutableArray *arrChatTest;
    LynnUserData *userMe;
    LynnUserData *userSomeone;
}

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarColorForViewController:self ofType:1 withTitleString:@"CHAT"];
    chatHandler = [ChatHandler sharedInstance];
    chatHandler.cpaas = self.cpaas;
    chatHandler.delegate = self;
    [chatHandler subscribeServices];
    arrChatTest = [[NSMutableArray alloc]init];
    _tbBubbleDemo.bubbleDataSource = self;
    _destinationNumber.placeholder = @"[userId]@[domain]";
    
    userMe  = [[LynnUserData alloc] initWithUserUniqueId:@"123" userNickName:@"" userProfileImage:nil additionalInfo:nil];
    userSomeone = [[LynnUserData alloc] initWithUserUniqueId:@"234" userNickName:@"" userProfileImage:[UIImage imageNamed:@"ico_girlprofile"] additionalInfo:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleKeybaordNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleKeybaordNotification:) name:UIKeyboardWillHideNotification object:nil];
    _inputTextView.layer.cornerRadius = 4.0;
    _inputTextView.layer.borderColor = [UIColor grayColor].CGColor;
    _inputTextView.layer.borderWidth = 0.8;
    [self addNavBarButton];
}

-(void) addNavBarButton {
     UIBarButtonItem *historyButton = [[UIBarButtonItem alloc]init];
     historyButton.action = @selector(getHistory);
     historyButton.title = @"Chat History";
     historyButton.target = self;
     historyButton.tintColor = UIColor.whiteColor;
     self.navigationItem.rightBarButtonItem = historyButton;
}


-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)inboundMessageReceived:(NSString *)message senderNumber:(NSString *)number
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self->userSomeone.userNickName = number;
        LynnBubbleData *bubbleData = [[LynnBubbleData alloc] initWithUserData:self->userSomeone dataOwner:BubbleDataTypeSomeone message:message messageDate:[NSDate date] attachedImage:nil];
        [self->arrChatTest addObject:bubbleData];
        [self->_tbBubbleDemo reloadData];
    });
}

-(void)deliveryStatusChanged{
    NSLog(@"deliveryStatusChanged");
}
-(void)outboundMessageSent{
    NSLog(@"OutboundMEssageSent");
}

- (IBAction)sendButtonTapped:(UIButton *)sender {
    
    if (_destinationNumber.text.length == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //LoaderClass.sharedInstance.hideOverlayView();
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter Destination UserId." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:YES
                                          completion:nil];
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];        });
    }
    else if (_inputTextView.text.length == 0)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            //LoaderClass.sharedInstance.hideOverlayView();
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter text" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:YES
                                          completion:nil];
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];        });
        
    }
    else{
        //LoaderClass.sharedInstance.showActivityIndicator();
        chatHandler.destinationNumber = _destinationNumber.text;
        [chatHandler sendMessage:_inputTextView.text];
    }
    
}

-(void) getHistory {
    if (self.destinationNumber.text && self.destinationNumber.text.length > 0) {
    [self.cpaas.chatService fetchConversationWithParticipant:self.destinationNumber.text completion:^(CPError * error, FetchResult * results) {
                if(error == nil) {
                    for (CPConversation* conversation in results.result) {
                        NSLog(@"conversation %@",conversation.lastText);
                        [conversation fetchMessagesWithCompletion:^(CPError * error, FetchResult * results) {
                            if(error == nil) {
                                for (CPMessage* message in results.result) {
                                    if([message.sender isEqualToString:self.destinationNumber.text]) {
                                        LynnBubbleData *bubbleData = [[LynnBubbleData alloc] initWithUserData:self->userSomeone dataOwner:BubbleDataTypeSomeone message:message.text messageDate:[NSDate date] attachedImage:nil];
                                        [self->arrChatTest addObject:bubbleData];
                                        [self->_tbBubbleDemo reloadData];
                                    } else {
                                        LynnBubbleData *bubbleData = [[LynnBubbleData alloc] initWithUserData:self->userMe dataOwner:BubbleDataTypeMe message:message.text messageDate:[NSDate date] attachedImage:nil];
                                        [self->arrChatTest addObject:bubbleData];
                                        [self->_tbBubbleDemo reloadData];
                                    }
                                }
                                  } else {
                                      NSLog(@"Couldn't fetch Message for Conversation: %@", error.localizedDescription);
                                  }
                        }];
                    }
                } else {
                    NSLog(@"Couldn't fetch conversations: %@", error.localizedDescription);
                }
    }];
    } else {
              UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter destination address to fetch the history." preferredStyle:UIAlertControllerStyleAlert];
               UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   [alert dismissViewControllerAnimated:YES
                                             completion:nil];
               }];
               [alert addAction:ok];
               [self presentViewController:alert animated:YES completion:nil];
    }
}
 
- (void)sendMessagewithSuccess:(BOOL)isSuccess
{
    if (isSuccess) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // LoaderClass.sharedInstance.hideOverlayView()
            self->userSomeone.userNickName = self.destinationNumber.text;
            LynnBubbleData *bubbleData = [[LynnBubbleData alloc] initWithUserData:self->userMe dataOwner:BubbleDataTypeMe message:self.inputTextView.text messageDate:[NSDate date] attachedImage:nil];
            [self->arrChatTest addObject:bubbleData];
            [self->_tbBubbleDemo reloadData];
            [self.inputTextView resignFirstResponder];
        });
    }
    else{
        dispatch_async(dispatch_get_main_queue(), ^{
           // LoaderClass.sharedInstance.hideOverlayView()
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Failed to sent. Try again later." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:YES
                                          completion:nil];
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
            [self.inputTextView resignFirstResponder];
            
        });
    }
    
}

-(void)handleKeybaordNotification:(NSNotification*)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
   BOOL isKeyboardShowing = [notification.name isEqualToString:UIKeyboardWillShowNotification];
    _bottomConstraint.constant = isKeyboardShowing ? keyboardFrame.size.height : 0;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.chatInputView.superview setNeedsLayout];
}

-(NSInteger)bubbleTableViewWithNumberOfRows:(LynnBubbleTableView *)bubbleTableView{
    return arrChatTest.count;
}

-(LynnBubbleData *)bubbleTableViewWithDataAt:(NSInteger)index bubbleTableView:(LynnBubbleTableView *)bubbleTableView{
    return arrChatTest[index];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
