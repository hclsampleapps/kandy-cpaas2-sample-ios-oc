
#import "AddressDirectoryViewController.h"


@interface AddressDirectoryViewController ()
{
    DirectoryViewController     *directoryController;
    AddressListViewController   *addressListController;
}

@end

@implementation AddressDirectoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarColorForViewController:self ofType:1 withTitleString:@"ADDRESSBOOK"];
    _segmentControl.selectedSegmentIndex = 0;
    [self updateView];
}


-(DirectoryViewController*)directoryViewController{
    directoryController = [[DirectoryViewController alloc]initWithNibName:@"DirectoryViewController" bundle:nil];
    directoryController.cpaas = self.cpaas;
    [self addChildContorller:directoryController];
    return directoryController;
}

-(AddressListViewController*)addressListViewController{
    addressListController = [[AddressListViewController alloc]initWithNibName:@"AddressListViewController" bundle:nil];
    addressListController.cpaas = self.cpaas;
    [self addChildContorller:addressListController];
    return addressListController;
}

-(void)addChildContorller:(UIViewController *)childController
{
    [self addChildViewController:childController];
    [_containerView addSubview:childController.view];
    childController.view.frame = _containerView.bounds;
    childController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ;
    [childController didMoveToParentViewController:self];
}

- (void)removeChildController:(UIViewController*)viewController{
    [viewController willMoveToParentViewController:nil];
    [viewController.view removeFromSuperview];
    [viewController removeFromParentViewController];
}

-(void)updateView{
    if (_segmentControl.selectedSegmentIndex == 0) {
        [self removeChildController:[self addressListViewController]];
        [self addChildContorller:[self directoryViewController]];
    }
    else{
        [self removeChildController:[self directoryViewController]];
        [self addChildContorller:[self addressListViewController]];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)segmentValueChanged:(id)sender {
    [self updateView];
}
@end
