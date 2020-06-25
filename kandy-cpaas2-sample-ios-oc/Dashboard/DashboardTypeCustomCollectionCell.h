

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DashboardTypeCustomCollectionCell : UICollectionViewCell

@property(nonatomic, weak) IBOutlet UILabel *lblName;
@property(nonatomic, weak) IBOutlet UIImageView *imgBg;
@property(nonatomic, weak) IBOutlet UIImageView *imgPreview1;

-(void)displayContentwithImage : (UIImage*)image andTitle : (NSString*)title;

@end

NS_ASSUME_NONNULL_END
