//
//  AddressListViewController.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/10/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "AddressListViewController.h"
#import "AddressListTableViewCell.h"
#import "AddressbookViewController.h"

//@interface AddressListViewController () <UITableViewDelegate, UITableViewDataSource>
//{
//    UIButton *roundButton;
//}
//
//@end

@implementation AddressListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_tblVw registerNib:[UINib nibWithNibName:@"AddressListTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddressListTableViewCell"];
    roundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    address_Handler = [AddressBookModule sharedInstance];
    address_Handler.delegate_AddressBook = self;

}

- (void)viewWillAppear:(BOOL)animated{
    [self createFloatingButton];
    
   // LoaderClass.sharedInstance.showActivityIndicator()
    address_Handler.cpaas = self.cpaas;
    address_Handler.delegate_AddressBook = self;
    [address_Handler fetchContactList];
}

-(void)viewWillDisappear:(BOOL)animated{
    if (roundButton.superview != nil) {
        [roundButton removeFromSuperview];
    }
}
- (void)fetchContactListFromArray:(NSMutableArray *)array{
    arrayAddressbook = array;
    [_tblVw reloadData];
    //LoaderClass.sharedInstance.hideOverlayView()
}

- (void)deleteSingleContact:(BOOL)isSuccess{
    if (isSuccess) {
        //LoaderClass.sharedInstance.showActivityIndicator()
        [address_Handler fetchContactList];
    }
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Unable to delete Contact. Please try again later." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES
                                      completion:nil];
        }];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void)createFloatingButton{
    
    
    roundButton.translatesAutoresizingMaskIntoConstraints = NO;
    roundButton.backgroundColor = [UIColor whiteColor];
    [roundButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [roundButton addTarget:self action:@selector(plusRoundButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *keyWindow = UIApplication.sharedApplication.keyWindow;
        if (keyWindow != nil){
            [keyWindow addSubview:self->roundButton];// self->roundButton];
            [NSLayoutConstraint activateConstraints:@[[keyWindow.trailingAnchor constraintEqualToAnchor:self->roundButton.trailingAnchor constant:15],[keyWindow.bottomAnchor constraintEqualToAnchor:self->roundButton.bottomAnchor constant:15],[self->roundButton.widthAnchor constraintEqualToConstant:75],[self->roundButton.heightAnchor constraintEqualToConstant:75]]];
        }
        
        self->roundButton.layer.cornerRadius = 37.5;
        self->roundButton.layer.shadowColor = [UIColor blackColor].CGColor;
        
        self->roundButton.layer.shadowOffset = CGSizeMake(0, 5);
        self->roundButton.layer.masksToBounds = NO;
        self->roundButton.layer.shadowRadius = 2.0;
        self->roundButton.layer.shadowOpacity = 0.5;
        // Add a pulsing animation to draw attention to button:
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration = 4.0;
        scaleAnimation.repeatCount = 1;
        scaleAnimation.autoreverses = YES;
//        scaleAnimation.fromValue = [NSValue va]
        //scaleAnimation.toValue = [NSValue valueWithPointer:1.0];
        [self->roundButton.layer addAnimation:scaleAnimation forKey:@"scale"];
        
    });
}

-(void)plusRoundButtonTapped : (UIButton*)sender{
    AddressbookViewController *vc = [[AddressbookViewController alloc]initWithNibName:@"AddressbookViewController" bundle:nil];
    vc.isToUpdate = NO;
    vc.cpaas = self.cpaas;
    [self.navigationController pushViewController:vc animated:YES];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayAddressbook.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddressbookBO *model = (AddressbookBO*)arrayAddressbook[indexPath.row];
    AddressListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressListTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.lblName.text = [NSString stringWithFormat: @"%@ %@", model.firstName, model.lastName];
    cell.lblEmail.text = model.email;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 63;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AddressbookBO *model = (AddressbookBO*)arrayAddressbook[indexPath.row];
    AddressbookViewController *vc = [[AddressbookViewController alloc]initWithNibName:@"AddressbookViewController" bundle:nil];
    vc.addressbook = model;
    vc.isToUpdate = YES;
    vc.cpaas = self.cpaas;
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AddressbookBO *model = (AddressbookBO*)arrayAddressbook[indexPath.row];
        //LoaderClass.sharedInstance.showActivityIndicator()
        CPContact *entity = [[CPContact alloc]initWithContactId:model.contactId];
        entity.email = model.email;
        entity.firstName = model.firstName;
        entity.lastName = model.lastName;
        entity.buddy = model.isBuddy;
        entity.homePhoneNumber = model.homePhoneNumber;
        entity.businessPhoneNumber = model.businessPhoneNumber;
        [address_Handler deleteSingleContact:entity];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert){
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view

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

@end
