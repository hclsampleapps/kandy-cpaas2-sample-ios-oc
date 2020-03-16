
#import "Directory_Search.h"
@import CPaaSSDK;

@interface Directory_Search ()

@end

@implementation Directory_Search

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)searchKeyWord : (NSString*)searchText searchType:(int)type {
    CPSearchFilter *filter = [[CPSearchFilter alloc] initWithValue:searchText forType:type];
    CPSearch *search = [[CPSearch alloc] initWithFilter:filter];
    [_cpaas.addressBookService searchWith:search completion:^(CPError * _Nullable error, CPSearchResult * _Nullable result) {
        if (error) {
            NSLog(@"Couldn't search in directory - Error: %@", error.localizedDescription);
            return;
        } else {
            NSLog(@"Results %@",result);
        }
    }];
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
