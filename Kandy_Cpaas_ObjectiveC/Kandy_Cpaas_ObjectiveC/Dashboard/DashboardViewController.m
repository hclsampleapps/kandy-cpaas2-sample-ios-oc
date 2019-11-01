//
//  DashboardViewController.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 10/25/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardTypeCustomCollectionCell.h"

@interface DashboardViewController () <UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    NSArray *mainContents;
}

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mainContents = [[NSArray alloc]initWithObjects : @"SMS", @"Chat", @"Voice/Video Call", @"Addressbook",@"Presence", nil];
    [self setNavigationBarColorForViewController:self ofType:0 withTitleString:@"DASHBOARD"];
    self.navigationItem.hidesBackButton = YES;
    [self.collectionVw registerNib:[UINib nibWithNibName:@"DashboardTypeCustomCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"DashboardTypeCustomCollectionCell"];

}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return mainContents.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DashboardTypeCustomCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DashboardTypeCustomCollectionCell" forIndexPath:indexPath];
    NSString *title = mainContents[indexPath.row];
    [cell displayContentwithImage:[UIImage imageNamed:@"SMS"] andTitle:title];
    cell.imgBg.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.imgBg.layer.borderWidth = 1.0;
    cell.imgBg.layer.shadowOffset = CGSizeMake(0, 2);
    cell.imgBg.layer.shadowOpacity = 0.6;
    cell.imgBg.layer.shadowRadius = 2.0;
    cell.imgBg.layer.shadowColor = [UIColor redColor].CGColor;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0){
        [self navigateToSMS];
    }
    else if (indexPath.item == 1) {
        [self navigateToChat];
    }
    else if (indexPath.item == 2) {
        [self navigateToVoiceVideo];
    }
    else if (indexPath.item == 3) {
        [self navigateToAddressBook];
    }
    else if (indexPath.item == 4) {
        [self navigateToPresence];
    }
    else{
        
    }
}

-(void)navigateToSMS{
    
}

-(void)navigateToChat{
    
}

-(void)navigateToVoiceVideo{
    
}

-(void)navigateToAddressBook{
    
}

-(void)navigateToPresence{
    
}

#pragma Layout Flow

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenSize       = UIScreen.mainScreen.bounds;
    CGFloat screenWidth     = screenSize.size.width - 20;
    CGFloat cellSquareSize  = (screenWidth/2.0);
    
    return CGSizeMake(cellSquareSize, 120.0);
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
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