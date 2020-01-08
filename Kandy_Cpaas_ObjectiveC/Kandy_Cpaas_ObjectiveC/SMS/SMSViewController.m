//
//  SMSViewController.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 1/7/20.
//  Copyright © 2020 hcl. All rights reserved.
//

#import "SMSViewController.h"

@interface SMSViewController ()<SMSDelegate,LynnBubbleViewDataSource>
{
        SMSHandler *smsHandler;
        NSMutableArray *arrSMSTest;
        LynnUserData *userMe;
        LynnUserData *userSomeone;
}
@end

@implementation SMSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarColorForViewController:self ofType:1 withTitleString:@"SMS"];
    smsHandler = [SMSHandler sharedInstance];
    smsHandler.cpaas = self.cpaas;
    smsHandler.delegate = self;
    [smsHandler subscribeServices];
    arrSMSTest = [[NSMutableArray alloc]init];
    _tbBubbleDemo.bubbleDataSource = self;
    _senderNumber.placeholder = @"Sender Number";
    _destinationNumber.placeholder = @"Destination Number";
    userMe  = [[LynnUserData alloc] initWithUserUniqueId:@"123" userNickName:@"" userProfileImage:nil additionalInfo:nil];
    userSomeone = [[LynnUserData alloc] initWithUserUniqueId:@"234" userNickName:@"" userProfileImage:[UIImage imageNamed:@"ico_girlprofile"] additionalInfo:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleKeybaordNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(handleKeybaordNotification:) name:UIKeyboardWillHideNotification object:nil];
    _inputTextView.layer.cornerRadius = 4.0;
    _inputTextView.layer.borderColor = [UIColor grayColor].CGColor;
    _inputTextView.layer.borderWidth = 0.8;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)inboundMessageReceived:(NSString *)message senderNumber:(NSString *)number
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self->userSomeone.userNickName = number;
        LynnBubbleData *bubbleData = [[LynnBubbleData alloc] initWithUserData:self->userSomeone dataOwner:BubbleDataTypeSomeone message:message messageDate:[NSDate date] attachedImage:nil];
        [self->arrSMSTest addObject:bubbleData];
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
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter Destination number." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alert dismissViewControllerAnimated:YES
                                          completion:nil];
            }];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];        });
    }
    else if (_senderNumber.text.length == 0)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            //LoaderClass.sharedInstance.hideOverlayView();
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Please enter sender number." preferredStyle:UIAlertControllerStyleAlert];
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
        smsHandler.sourceNumber = _senderNumber.text;
        smsHandler.destinationNumber = _destinationNumber.text;
        [smsHandler sendMessage:_inputTextView.text];
    }
}
- (void)sendMessagewithSuccess:(BOOL)isSuccess
{
    if (isSuccess) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // LoaderClass.sharedInstance.hideOverlayView()
            self->userSomeone.userNickName = self.destinationNumber.text;
            LynnBubbleData *bubbleData = [[LynnBubbleData alloc] initWithUserData:self->userMe dataOwner:BubbleDataTypeMe message:self.inputTextView.text messageDate:[NSDate date] attachedImage:nil];
            [self->arrSMSTest addObject:bubbleData];
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
    return arrSMSTest.count;
}

-(LynnBubbleData *)bubbleTableViewWithDataAt:(NSInteger)index bubbleTableView:(LynnBubbleTableView *)bubbleTableView{
    return arrSMSTest[index];
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
