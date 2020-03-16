//
//  AddressBookModule.h
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/11/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DirectoryBO.h"
@import CPaaSSDK;

NS_ASSUME_NONNULL_BEGIN

@protocol AddressBookDelegate <NSObject>
-(void)fetchContactListFromArray:(NSMutableArray*)array;
-(void)deleteSingleContact:(BOOL)isSuccess;
@end

@protocol AddressBookAddUpdateDelegate <NSObject>
-(void)updatedContact:(BOOL)isSuccess;
-(void)addedContact:(BOOL)isSuccess;
@end

@interface AddressBookModule : NSObject
{
    CPAddressBookService *service;
}
@property(nonatomic,weak) id<AddressBookDelegate> delegate_AddressBook;
@property(nonatomic,weak) id<AddressBookAddUpdateDelegate> delegate_AddUpdateAddressBook;

@property(nonatomic,strong) CPaaS *cpaas;

+ (instancetype)sharedInstance;
-(CPAuthenticationService*)authentication;
-(void)fetchContactList;
-(void)deleteSingleContact: (CPContact*)contact;
-(void)createContact:(AddressbookBO*)model;
-(void)updateContact:(AddressbookBO*)model;
@end

NS_ASSUME_NONNULL_END
