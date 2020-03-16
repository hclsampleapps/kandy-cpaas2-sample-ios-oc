//
//  BaseViewController.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 10/16/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

-(void)setNavigationBarColorForViewController : (UIViewController*)viewController ofType : (NSInteger)type withTitleString : (NSString*)titleString;
    
@end

NS_ASSUME_NONNULL_END
