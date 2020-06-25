
#import "PresenceViewController.h"
#import "GroupCollectionCell.h"

@interface PresenceViewController ()<PresenceDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation PresenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarColorForViewController:self ofType:1 withTitleString:@"Presence"];
    presenties = [[NSMutableArray alloc]init];
    activityTypesArray = [[NSArray alloc]initWithObjects:@"Available",@"Unknown", @"Other", @"Away", @"Busy", @"Lunch", @"OnThePhone", @"Vacation", nil];
    presenceHandler = [PresenceHandler sharedInstance];
    presenceHandler.cpaas = self.cpaas;
    [presenceHandler subscribeServices];
    presenceHandler.delegate = self;
    [presenceHandler fetchAllPrentities];
    [self registerNib];
    [self setStatus];
    self.status_pickerView.delegate = self;
    self.status_pickerView.dataSource = self;
    
    // Do any additional setup after loading the view.
}

-(UIColor*)getStatusColor:(NSString*)status{
    if ([status isEqualToString:@"Available"])
        return UIColor.greenColor;
    else if([status isEqualToString:@"Busy"] || [status isEqualToString:@"Away"] || [status isEqualToString:@"Vacation"])
        return UIColor.redColor;
    else
        return UIColor.yellowColor;
}

-(void)setStatus{
    NSString *currentStatus = [NSUserDefaults.standardUserDefaults objectForKey:@"CurrentStatus"];
    NSString *currentStatusColor = [NSUserDefaults.standardUserDefaults objectForKey:@"CurrentStatus"];
    if (currentStatus != nil && currentStatusColor != nil) {
        self.status_lbl.text = currentStatus;
        self.status_imgView.backgroundColor = [self getStatusColor:currentStatusColor];
    }
}

-(void)registerNib{
    [self.groupCollectionView registerNib:[UINib nibWithNibName:@"GroupCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"GroupCollectionCell"];
    self.groupCollectionView.delegate = self;
    self.groupCollectionView.dataSource = self;
    //self.groupCollectionView.hidden = YES;
}

- (void)updateUserStatus:(NSString *)status{
    self.status_lbl.text = status;
    [NSUserDefaults.standardUserDefaults setValue:status forKey:@"CurrentStatus"];
}

- (void)updateUserStatusColor:(NSString *)status{
    self.status_imgView.backgroundColor = [self getStatusColor:status];
    [NSUserDefaults.standardUserDefaults setValue:status forKey:@"CurrentStatusColor"];
}
- (IBAction)updateStatus:(UIButton *)sender {
    //self.status_pickerView.hidden = YES;
}

- (IBAction)showGroups:(UIButton *)sender {
    if (sender.selected) {
       // self.groupCollectionView.hidden = YES;
    }else{
       // self.groupCollectionView.hidden = NO;
    }
    sender.selected = !sender.selected;
}
-(void)updateUserSelectedStatus:(NSString*)userStatus{
    self.status_imgView.backgroundColor = [self getStatusColor:userStatus];
    [presenceHandler updateStatus:userStatus];
}

-(void)listOfPresenties:(CPPresentityList *)list{
    if (list) {
        [presenties addObject:list.presentities];
        [self.groupCollectionView reloadData];
    }
}
//PickerView DataSource and delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return activityTypesArray.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return activityTypesArray[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self updateUserSelectedStatus:activityTypesArray[row]];
}

//CollectionView Delegate and DataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (prentiyList){
        return  prentiyList.presentities.count;
    }
    return 0;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width, 30.0);
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GroupCollectionCell *aCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GroupCollectionCell" forIndexPath:indexPath];
    CPPresentity *presentity = presenties[indexPath.row];
    [aCell configCell:presentity.userID withStatus:presentity.activity.string];
    return aCell;
}

@end
