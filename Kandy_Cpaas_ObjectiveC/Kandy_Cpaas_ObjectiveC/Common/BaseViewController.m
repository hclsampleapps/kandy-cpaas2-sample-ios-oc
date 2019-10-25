//
//  BaseViewController.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 10/16/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "BaseViewController.h"

//#define ui
@interface BaseViewController ()
//UIColor(red: 4.0/255.0, green: 160.0/255.0, blue: 214.0/255.0, alpha: 1.0)@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



-(void)setNavigationBarColorForViewController : (UIViewController*)viewController ofType : (NSInteger)type withTitleString : (NSString*)titleString{
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 64)];
    //bgView.backgroundColor = [UIColor redColor];
    bgView.backgroundColor = [UIColor colorWithRed:4.0f/255.0f green:160.0f/255.0f blue:214.0f/255.0f alpha:1.0f];
    UIGraphicsBeginImageContextWithOptions(bgView.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextFillRect(ctx, bgView.bounds);
    [bgView.layer renderInContext:ctx];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [viewController.navigationController.navigationBar setBackgroundImage:viewImage forBarMetrics:UIBarMetricsDefault];
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake((bgView.frame.size.width/2)-25, 14.5, 50, 35)];
    titleLable.text = titleString;
    titleLable.textColor = [UIColor whiteColor];
    titleLable.contentMode = UIViewContentModeScaleAspectFit;
    viewController.navigationItem.titleView = titleLable;
    
    if (type == 1){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:button];
        viewController.navigationItem.leftBarButtonItem = leftBarButton;
    }
    else if (type == 2){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:@"" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backMenuTapped) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:button];
        viewController.navigationItem.leftBarButtonItem = leftBarButton;
    }
    else{
        NSLog(@"aa");
    }
}

-(void)backButtonTapped{
    if ([self.navigationController popViewControllerAnimated:YES] == nil)  {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)backMenuTapped{
    
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
