//
//  DirectoryViewController.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/7/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "DirectoryViewController.h"
#import "DirectoryTableViewCell.h"
#import "DirectoryModule.h"

@interface DirectoryViewController () <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,DirectoryModuleDelegate>
{
    NSMutableArray *filtered;
    DirectoryModule *directory_Handler;
}
@end

@implementation DirectoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_tblVw_Directory registerNib:[UINib nibWithNibName:@"DirectoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"DirectoryTableViewCell"];
    [self btnFilterTappedWithSender:_btn_Name];
    _searchBar.placeholder = NSLocalizedString(@"Search text", @"");
    directory_Handler = [DirectoryModule sharedInstance];
    directory_Handler.cpaas = self.cpaas;
    directory_Handler.delegate = self;
}
- (void)searchContactInDirectoryWithArray:(NSMutableArray *)array{
    filtered = array;
    [self.tblVw_Directory reloadData];
    // to do
    //LoaderClass.sharedInstance.hideOverlayView();
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [DirectoryTableViewCell height];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return filtered.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [[UITableViewCell alloc]init];;
    DirectoryTableViewCell *cell = [_tblVw_Directory dequeueReusableCellWithIdentifier:@"DirectoryTableViewCell"];
    [cell displayContentTypewith:(DirectoryBO*)filtered[indexPath.row]];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)btnFilterTappedWithSender:(UIButton*)sender {
   
    _btn_Name.selected = NO;
    _btn_FirstName.selected = NO;
    _btn_LastName.selected = NO;
    _btn_PhoneNum.selected = NO;
    if (sender.tag == 100)
        _btn_Name.selected = true;
    else if (sender.tag == 101)
        _btn_FirstName.selected = true;
    else if (sender.tag == 102)
        _btn_LastName.selected = true;
    else
        _btn_PhoneNum.selected = true;
}

//Pragma SearchBar Delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    for (UIButton *subView in searchBar.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *cancelButton = subView;
            [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        }
    }
    [_tblVw_Directory reloadData];
    return YES;
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (range.location == 0 && range.length == 0 && [text  isEqual: @" "]) {
        return NO;
    }
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    _searchBar.showsCancelButton = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = NO;
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    [_tblVw_Directory reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    for (UIButton *possibleButton in searchBar.subviews) {
        if ([possibleButton isKindOfClass:[UIButton class]]) {
            UIButton *cancelButton = possibleButton;
            cancelButton.enabled = YES;
            break;
        }
    }
    //LoaderClass.sharedInstance.showActivityIndicator()
    if (_btn_Name.isSelected) {
        [directory_Handler searchContactInDirectory:searchBar.text withSelectedFilterKeyType:CPAddressBookFieldTypeName andOrderType:CPAddressBookOrderTypeAscending andSortType:CPAddressBookFieldTypeName];
    }
    else if (_btn_FirstName.isSelected){
        [directory_Handler searchContactInDirectory:searchBar.text withSelectedFilterKeyType:CPAddressBookFieldTypeFirstname andOrderType:CPAddressBookOrderTypeAscending andSortType:CPAddressBookFieldTypeName];
    }
    else if (_btn_LastName.isSelected){
        [directory_Handler searchContactInDirectory:searchBar.text withSelectedFilterKeyType:CPAddressBookFieldTypeLastname andOrderType:CPAddressBookOrderTypeAscending andSortType:CPAddressBookFieldTypeName];
    }
    else if (_btn_PhoneNum.isSelected){
        [directory_Handler searchContactInDirectory:searchBar.text withSelectedFilterKeyType:CPAddressBookFieldTypePhoneNumber andOrderType:CPAddressBookOrderTypeAscending andSortType:CPAddressBookFieldTypeName];
    }
    else{
        [directory_Handler searchContactInDirectory:searchBar.text withSelectedFilterKeyType:CPAddressBookFieldTypeName andOrderType:CPAddressBookOrderTypeAscending andSortType:CPAddressBookFieldTypeName];
    }
}

@end
