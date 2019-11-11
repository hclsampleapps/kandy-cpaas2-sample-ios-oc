//
//  AddressbookViewController.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/7/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "AddressbookViewController.h"

@interface AddressbookViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation AddressbookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self setNavigationBarColorForViewController:self ofType:1 withTitleString:@""];
     [_tblVw registerNib:[UINib nibWithNibName:@"AddressbookTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddressbookTableViewCell"];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAddUpdateTapped:(UIButton *)sender {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 473;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //AddressbookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressbookTableViewCell" forIndexPath:indexPath];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //[cell.btnBuddy addTarget:self action:@selector(buddyTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    //to do
    //cell.displayContentType(object: addressbook)
    return cell;
}

-(void)buddyTapped:(UIButton*)sender{
    
}
@end
