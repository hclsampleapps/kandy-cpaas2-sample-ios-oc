
#import "Address_Controller.h"

@interface Address_Controller ()

@end

@implementation Address_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) addContact {
    CPContact *entity = [[CPContact alloc] initWithContactId:@""];
    entity.firstName = @"Rahul";
    entity.lastName = @"Gupta";
    entity.mobile = @"00000000000";
    
    NSString* addressBookId = @"test";
    
    /// Save contact to personal addressbook
    /// cpaas is the main instance which holds logged-in user.
    [_cpaas.addressBookService addContactWithAddressBookId:addressBookId contact:entity completion:^(CPError * error) {
        if (error) {
            NSLog(@"Couldn't save the contact to addressbook - Error: %@", error.localizedDescription);
            return;
        }
        NSLog(@"Contact is saved to the addressbook");
    }];
    NSLog(@"Contact is saved to the addressbook");
}

-(void) updateContact {
    CPContact *entity = [[CPContact alloc] initWithContactId:@""];
    entity.firstName = @"Rahul";
    entity.lastName = @"Gupta";
    entity.mobile = @"00000000000";
    NSString* addressBookId = @"test";
    [_cpaas.addressBookService updateContactWithAddressBookId:addressBookId contact:entity completion:^(CPError * error) {
        if (error) {
            NSLog(@"Couldn't save the contact to addressbook - Error: %@", error.localizedDescription);
            return;
        }
        NSLog(@"Contact is saved to the addressbook");
    }];
    NSLog(@"Contact is saved to the addressbook");
}

-(void) getAllContacts {
    NSString* addressBookId = @"test";
    /// cpaas is the main instance which holds logged-in user.
    [_cpaas.addressBookService retrieveContactListWithAddressBookId:addressBookId completion:^(CPError * error, NSArray<CPContact *> * contactArray) {
        if (error) {
            NSLog(@"Couldn't retrieve contact list from addressbook - Error: %@", error.localizedDescription);
            return;
        }
        
        for (CPContact *contact in contactArray) {
            NSLog(@"Contact: %@", contact);
        } }];
}

-(void) deleteContact {
    NSString* addressBookId = @"test";
    NSString* contactIdentifier = @"test";
    [_cpaas.addressBookService deleteContactWithAddressBookId:addressBookId identifier:contactIdentifier completion:^(CPError * error) {
        if (error) {
            NSLog(@"Couldn't delete the contact from addressbook - Error: %@", error.localizedDescription);
            return;
        }
        NSLog(@"Contact is deleted");
    }];
}

-(void) getSingleContact {
    NSString* addressBookId = @"test";
    NSString* contactIdentifier = @"test";
    [_cpaas.addressBookService getContactWithAddressBookId:addressBookId contactId:contactIdentifier completion:^(CPError * _Nullable error, CPContact * retrievedContact) {
        if (error) {
            NSLog(@"Couldn't get the contact from addressbook - Error: %@", error.localizedDescription);
            return;
        }
        NSLog(@"Contact is retrieved successfuly - Contact: %@", retrievedContact);
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
