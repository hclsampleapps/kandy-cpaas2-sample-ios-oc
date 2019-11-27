//
//  DirectoryModule.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/11/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DirectoryBO.h"
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN
@protocol DirectoryModuleDelegate <NSObject>

-(void)searchContactInDirectoryWithArray: (NSMutableArray*)array;

@end

@interface DirectoryModule : NSObject
{
    CPaaS *cpaas;
    CPAddressBookService *service;
}
+ (instancetype)sharedInstance;
@property(nonatomic,weak) id<DirectoryModuleDelegate> delegate;
@property(nonatomic,strong) CPaaS *cpaas;;
-(CPAuthenticationService*)authentication;
-(void)searchContactInDirectory:(NSString*)searchText withSelectedFilterKeyType : (CPAddressBookFieldType)filterType andOrderType : (CPAddressBookOrderType)orderType andSortType : (CPAddressBookFieldType)sortType;
@end

NS_ASSUME_NONNULL_END
