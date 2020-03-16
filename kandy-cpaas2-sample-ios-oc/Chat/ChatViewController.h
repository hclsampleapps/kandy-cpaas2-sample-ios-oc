
#import "BaseViewController.h"
#import "ChatHandler.h"
#import "kandy_cpaas2_sample_ios_oc-Swift.h"

@class LynnBubbleTableView;

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
