
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GroupCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel          *name_lbl;
@property (weak, nonatomic) IBOutlet UILabel          *status_lbl;
@property (weak, nonatomic) IBOutlet UIImageView      *status_imageView;

-(void)configCell:(NSString*)name withStatus:(NSString*)status;
@end

NS_ASSUME_NONNULL_END
