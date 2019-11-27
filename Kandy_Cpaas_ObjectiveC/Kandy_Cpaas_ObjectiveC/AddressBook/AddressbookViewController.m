//
//  AddressbookViewController.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/7/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "AddressbookViewController.h"

@interface AddressbookViewController () <UITableViewDelegate,UITableViewDataSource,AddressBookAddUpdateDelegate,UITextFieldDelegate>

@end

@implementation AddressbookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarColorForViewController:self ofType:1 withTitleString:@""];
     [_tblVw registerNib:[UINib nibWithNibName:@"AddressbookTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddressbookTableViewCell"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    address_Handler = [AddressBookModule sharedInstance];
    address_Handler.cpaas = self.cpaas;
    address_Handler.delegate_AddUpdateAddressBook = self;
    
    if (_isToUpdate)
        [_btnAddUpdate setTitle:@"UPDATE CONTACT" forState:UIControlStateNormal];
    else
        [_btnAddUpdate setTitle:@"ADD CONTACT" forState:UIControlStateNormal];
}

- (void)updatedContact:(BOOL)isSuccess{
    if (isSuccess){
        //LoaderClass.sharedInstance.showActivityIndicator()
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Unable to update Contact. Please try again later." preferredStyle:UIAlertControllerStyleAlert];
               UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   [alert dismissViewControllerAnimated:YES
                                             completion:nil];
               }];
               [alert addAction:ok];
               [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void)addedContact:(BOOL)isSuccess{
    if (isSuccess){
        //LoaderClass.sharedInstance.showActivityIndicator()
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Unable to add Contact. Please try again later." preferredStyle:UIAlertControllerStyleAlert];
               UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                   [alert dismissViewControllerAnimated:YES
                                             completion:nil];
               }];
               [alert addAction:ok];
               [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)btnAddUpdateTapped:(UIButton *)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    AddressbookTableViewCell *cell = [_tblVw cellForRowAtIndexPath:indexPath];
    AddressbookBO *object = [[AddressbookBO alloc]init];
    object.contactId = cell.txtContactId.text;
    object.primaryContact = cell.txtPrimaryContact.text;
    object.firstName = cell.txtFirstName.text;
    object.lastName = cell.txtLastName.text;
    object.email = cell.txtEmail.text;
    object.homePhoneNumber = cell.txtHomePhoneNumber.text;
    object.businessPhoneNumber = cell.txtBusinessPhoneNumber.text;
    if (_isToUpdate) {
        object.isBuddy = _addressbook.isBuddy;
        [address_Handler updateContact:object];
    }
    else
    {
        object.isBuddy = cell.btnBuddy.isSelected;
        [address_Handler createContact:object];
    }
}
-(void)buddyTapped:(UIButton*)sender{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    AddressbookTableViewCell *cell = [_tblVw cellForRowAtIndexPath:indexPath];
    if (_isToUpdate) {
        if (_addressbook.isBuddy)
            _addressbook.isBuddy = NO;
        else
            _addressbook.isBuddy = YES;
        cell.imgBuddy.image = _addressbook.isBuddy ? [UIImage imageNamed:@"selected"] : [UIImage imageNamed:@"unSelected"];
    }
    else{
        if (cell.btnBuddy.isSelected) {
            cell.btnBuddy.selected = NO;
        }
        else{
            cell.btnBuddy.selected = YES;
        }
        cell.imgBuddy.image = _addressbook.isBuddy ? [UIImage imageNamed:@"selected"] : [UIImage imageNamed:@"unSelected"];
    }
}

-(void)keyboardWillShow:(NSNotification*)notification{
    CGRect kbrect = CGRectFromString(notification.userInfo[UIKeyboardFrameEndUserInfoKey]);
    CGFloat heightOffset = self.tblVw.frame.origin.y + self.tblVw.frame.size.height;
    if (heightOffset > (kbrect.origin.y)) {
         [UIView beginAnimations:nil context:NULL];
         [UIView setAnimationDuration:0.3];
        self.tblVw.contentOffset = CGPointMake(0, heightOffset - (kbrect.origin.y));
        [UIView commitAnimations];
    }
    else {}
}

-(void)keyboardWillHide:(NSNotification*)notification{
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.3];
    _tblVw.contentOffset = CGPointMake(0, 0);
    [UIView commitAnimations];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 473;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddressbookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressbookTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //[cell.btnBuddy addTarget:self action:@selector(buddyTapped:) forControlEvents:UIControlEventTouchUpInside];
    [cell displayContentTypewith:_addressbook];
    return cell;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
