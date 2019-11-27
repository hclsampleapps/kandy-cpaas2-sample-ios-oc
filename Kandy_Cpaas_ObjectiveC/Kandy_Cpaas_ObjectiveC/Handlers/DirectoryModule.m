//
//  DirectoryModule.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/11/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "DirectoryModule.h"

@import CPaaSSDK;



@implementation DirectoryModule
+ (instancetype)sharedInstance
{
    static DirectoryModule *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DirectoryModule alloc] init];
    });
    return sharedInstance;
}

- (CPAuthenticationService *)authentication{
    return cpaas.authenticationService;
}

-(void)searchContactInDirectory:(NSString*)searchText withSelectedFilterKeyType : (CPAddressBookFieldType)filterType andOrderType : (CPAddressBookOrderType)orderType andSortType : (CPAddressBookFieldType)sortType{
    
    CPSearchFilter *searchObj = [[CPSearchFilter alloc]initWithValue:searchText forType:filterType];
    CPSearch *search = [[CPSearch alloc]initWithFilter:searchObj];
    search.orderBy = orderType;
    search.sortBy = sortType;
    search.limit = 50;
    [cpaas.addressBookService searchWith:search completion:^(CPError * _Nullable error, CPSearchResult * _Nullable searchResult) {
        NSMutableArray *arrDirectory = [[NSMutableArray alloc]init];
        if(error != nil){
            if ([self.delegate conformsToProtocol:@protocol(DirectoryModuleDelegate)] && [self.delegate respondsToSelector:@selector(searchContactInDirectoryWithArray:)]) {
                [self.delegate searchContactInDirectoryWithArray:arrDirectory];
            }
            return;
        }
        for (CPContact *contact in searchResult.contacts) {
            DirectoryBO *directoryBO = [[DirectoryBO alloc]init];
            directoryBO.name = contact.contactId;
            directoryBO.firstName = contact.firstName;
            directoryBO.lastName = contact.lastName;
            directoryBO.email = contact.email;
            directoryBO.userId = contact.contactId;
            directoryBO.photoUrl = contact.photoUrl;
            directoryBO.isBuddy = contact.buddy;
            [arrDirectory addObject:directoryBO];
        }
        if ([self.delegate conformsToProtocol:@protocol(DirectoryModuleDelegate)] && [self.delegate respondsToSelector:@selector(searchContactInDirectoryWithArray:)]) {
            [self.delegate searchContactInDirectoryWithArray:arrDirectory];
        }
        
    }];
}
@end
