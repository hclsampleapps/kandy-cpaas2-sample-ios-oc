
#import "DashboardTypeCustomCollectionCell.h"

@implementation DashboardTypeCustomCollectionCell

-(void)displayContentwithImage : (UIImage*)image andTitle : (NSString*)title{
    _lblName.text = title;
    _imgPreview1.image = image;
}


@end
