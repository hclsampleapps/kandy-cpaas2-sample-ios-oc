//
//  AddressBookModule.m
//  Kandy_Cpaas_ObjectiveC
//
//  Created by Kunal Nagpal on 11/11/19.
//  Copyright © 2019 hcl. All rights reserved.
//

#import "AddressBookModule.h"
#import "DirectoryBO.h"

@implementation AddressBookModule

+ (instancetype)sharedInstance
{
    static AddressBookModule *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AddressBookModule alloc] init];
    });
    return sharedInstance;
}
- (CPAuthenticationService *)authentication{
    return _cpaas.authenticationService;
}

-(void)fetchContactList{

    [_cpaas.addressBookService retrieveContactListWithAddressBookId:@"default" completion:^(CPError *error, NSArray<CPContact *> *contactList) {
        NSMutableArray *arrAddressbook = [[NSMutableArray alloc]init];
        if(error != nil){
        if ([self.delegate_AddressBook conformsToProtocol:@protocol(AddressBookDelegate)] && [self.delegate_AddressBook respondsToSelector:@selector(fetchContactListFromArray:)]) {
            [self.delegate_AddressBook fetchContactListFromArray:arrAddressbook];
        }
        return;
    }
        for (CPContact *contact in contactList) {
            AddressbookBO *addressbookBO = [[AddressbookBO alloc]init];
            addressbookBO.contactId = contact.contactId;
            addressbookBO.primaryContact = contact.contactId; //'primaryContact' is inaccessible due to 'internal' protection level
            addressbookBO.firstName = contact.firstName;
            addressbookBO.lastName = contact.lastName;
            addressbookBO.email = contact.email;
            addressbookBO.homePhoneNumber = contact.homePhoneNumber;
            addressbookBO.businessPhoneNumber = contact.businessPhoneNumber;
            addressbookBO.isBuddy = contact.buddy;
            [arrAddressbook addObject:addressbookBO];
        }
        if ([self.delegate_AddressBook conformsToProtocol:@protocol(AddressBookDelegate)] && [self.delegate_AddressBook respondsToSelector:@selector(fetchContactListFromArray:)]) {
                   [self.delegate_AddressBook fetchContactListFromArray:arrAddressbook];
               }
    }];
}

-(NSString*)randomString:(NSInteger) length {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSUInteger len = letters.length;
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
         [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int32_t)len)]];
    }
    return randomString;
}
-(void)createContact:(AddressbookBO*)model {
    NSString *addressID= [self randomString:10];
    CPContact *entity = [[CPContact alloc]initWithContactId:addressID];
    entity.contactId = model.contactId;
    //        entity.username = model.primaryContact // primaryContact should be here
    entity.email = model.email;
    entity.firstName = model.firstName;
    entity.lastName = model.lastName;
    entity.buddy = model.isBuddy;
    entity.homePhoneNumber = model.homePhoneNumber;
    entity.businessPhoneNumber = model.businessPhoneNumber;
    __weak typeof(self) weakSelf = self;
    [_cpaas.addressBookService addContactWithAddressBookId:@"default" contact:entity completion:^(CPError * error) {
        if(error != nil)
        {
         if ([weakSelf.delegate_AddUpdateAddressBook conformsToProtocol:@protocol(AddressBookAddUpdateDelegate)] &&  [weakSelf.delegate_AddUpdateAddressBook respondsToSelector:@selector(addedContact:)]) {
             [weakSelf.delegate_AddUpdateAddressBook addedContact:NO];
             
           }
            return ;
        }
        NSLog(@"Contact is saved to the addressbook");
        if ([weakSelf.delegate_AddUpdateAddressBook conformsToProtocol:@protocol(AddressBookAddUpdateDelegate)] && [weakSelf.delegate_AddUpdateAddressBook respondsToSelector:@selector(addedContact:)]) {
            [weakSelf.delegate_AddUpdateAddressBook addedContact:YES];
        }
    }];
}

-(void)updateContact:(AddressbookBO*)model {
    CPContact *entity = [[CPContact alloc]initWithContactId:model.contactId];
    entity.contactId = model.contactId;
    //        entity.username = model.primaryContact // primaryContact should be here
    entity.email = model.email;
    entity.firstName = model.firstName;
    entity.lastName = model.lastName;
    entity.buddy = model.isBuddy;
    entity.homePhoneNumber = model.homePhoneNumber;
    entity.businessPhoneNumber = model.businessPhoneNumber;
    __weak typeof(self) weakSelf = self;
    [_cpaas.addressBookService updateContactWithAddressBookId:@"default" contact:entity completion:^(CPError * error) {
        if(error != nil)
        {
            if ([weakSelf.delegate_AddUpdateAddressBook conformsToProtocol:@protocol(AddressBookAddUpdateDelegate)] &&  [weakSelf.delegate_AddUpdateAddressBook respondsToSelector:@selector(updatedContact:)]) {
                [weakSelf.delegate_AddUpdateAddressBook updatedContact:NO];
                
            }
            return ;
        }
        if ([weakSelf.delegate_AddUpdateAddressBook conformsToProtocol:@protocol(AddressBookAddUpdateDelegate)] &&  [weakSelf.delegate_AddUpdateAddressBook respondsToSelector:@selector(updatedContact:)]) {
            [weakSelf.delegate_AddUpdateAddressBook updatedContact:YES];
        }
    }];
}

-(void)deleteSingleContact: (CPContact*)contact{
    __weak typeof(self) weakSelf = self;
    [_cpaas.addressBookService deleteContactWithAddressBookId:@"default" identifier:contact.contactId completion:^(CPError * error) {
        if(error != nil)
        {
            if ([weakSelf.delegate_AddressBook conformsToProtocol:@protocol(AddressBookDelegate)] &&  [weakSelf.delegate_AddressBook respondsToSelector:@selector(deleteSingleContact:)]) {
                [weakSelf.delegate_AddressBook deleteSingleContact:NO];
                
            }
            return ;
        }
        if ([weakSelf.delegate_AddressBook conformsToProtocol:@protocol(AddressBookDelegate)] &&  [weakSelf.delegate_AddressBook respondsToSelector:@selector(deleteSingleContact:)]) {
            [weakSelf.delegate_AddressBook deleteSingleContact:YES];
        }
    }];
}

-(void)getSingleContact:(NSString*)contactId{
    [_cpaas.addressBookService getContactWithAddressBookId:@"default" contactId:contactId completion:^(CPError * error, CPContact * retrievedContact) {
        if (error != nil) {
            NSLog(@"Couldn't get the contact from addressbook");
            return ;
        }
    }];
}

@end
