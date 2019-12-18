//
//  ChatViewController.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 12/6/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "BaseViewController.h"
#import "Kandy_Cpaas_ObjectiveC-Swift.h"
#import "ChatHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : BaseViewController

@property (weak, nonatomic) IBOutlet LynnBubbleTableView    *tbBubbleDemo;
@property (weak, nonatomic) IBOutlet UITextField            *destinationNumber;
@property (weak, nonatomic) IBOutlet UIView                 *chatInputView;
@property (weak, nonatomic) IBOutlet UITextView             *inputTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint     *bottomConstraint;
@property (weak, nonatomic) IBOutlet UIButton               *sendButton;

@property(strong, nonatomic) CPaaS* cpaas;
- (IBAction)sendButtonTapped:(UIButton *)sender;
@end

NS_ASSUME_NONNULL_END
