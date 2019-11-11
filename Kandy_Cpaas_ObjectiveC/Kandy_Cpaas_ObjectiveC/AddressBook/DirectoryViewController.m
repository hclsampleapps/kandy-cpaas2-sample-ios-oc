//
//  DirectoryViewController.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/7/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "DirectoryViewController.h"
#import "DirectoryTableViewCell.h"

@interface DirectoryViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation DirectoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_tblVw_Directory registerNib:[UINib nibWithNibName:@"DirectoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"DirectoryTableViewCell"];
    [self btnFilterTappedWithSender:_btn_Name];
    _searchBar.placeholder = NSLocalizedString(@"Search text", @"");
    
    //To do
   // directory_Handler.cpaas = self.cpaas
   // directory_Handler.delegate_Directory = self
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 412;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];;
   // DirectoryTableViewCell *cell = [_tblVw_Directory dequeueReusableCellWithIdentifier:@"DirectoryTableViewCell"];
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

@end
