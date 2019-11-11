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

@interface AddressListViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UIButton *roundButton;
}
@end

@implementation AddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_tblVw registerNib:[UINib nibWithNibName:@"AddressListTableViewCell" bundle:nil] forCellReuseIdentifier:@"AddressListTableViewCell"];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self createFloatingButton];
}

-(void)viewWillDisappear:(BOOL)animated{
    if (roundButton.superview != nil) {
        [self->roundButton removeFromSuperview];
    }
}

-(void)createFloatingButton{
    
    roundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    roundButton.translatesAutoresizingMaskIntoConstraints = NO;
    roundButton.backgroundColor = [UIColor whiteColor];
    [roundButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [roundButton addTarget:self action:@selector(plusRoundButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *keyWindow = UIApplication.sharedApplication.keyWindow  ;
        if (keyWindow){
            [keyWindow addSubview:self->roundButton];
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
        scaleAnimation.repeatCount = HUGE_VALF;
        scaleAnimation.autoreverses = YES;
        //scaleAnimation.fromValue = 1.0;
        //scaleAnimation.toValue = [NSValue valueWithPointer:1.0];
        [self->roundButton.layer addAnimation:scaleAnimation forKey:@"scale"];
        
    });
}

-(void)plusRoundButtonTapped : (UIButton*)sender{
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //AddressListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressListTableViewCell" forIndexPath:indexPath];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //to do
    //let model = arrayAddressbook[indexPath.row]
    //cell.lblName.text = model.firstName + " " + model.lastName
    //cell.lblEmail.text = model.email
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 63;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddressbookViewController *vc = [[AddressbookViewController alloc]initWithNibName:@"AddressbookViewController" bundle:nil];
    vc.cpaas = self.cpaas;
    [self.navigationController pushViewController:vc animated:YES];
    
    //to do
    //let model = arrayAddressbook[indexPath.row]
    
    //vc.addressbook = model
   // vc.isToUpdate = true
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //to do
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
