// Generated by Apple Swift version 5.0 (swiftlang-1001.0.69.5 clang-1001.0.46.3)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CPUtilities;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="CPAddressBookService",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif


/// Contains Enums used by Address Book Service.
/// since:
/// 1.0.0
SWIFT_CLASS("_TtC20CPAddressBookService13CPAddressBook")
@interface CPAddressBook : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

/// Contains search field type keys for directory search.
/// Should be used when specifying search field type and sorting rule while performing
/// search operation in directory.
/// since:
/// 1.0.0
typedef SWIFT_ENUM_NAMED(NSInteger, CPAddressBookFieldType, "FieldType", closed) {
/// Represents both firstname and lastname fields of contacts
  CPAddressBookFieldTypeName = 0,
/// Represents first name field of contacts
  CPAddressBookFieldTypeFirstname = 1,
/// Represents last name field of contacts
  CPAddressBookFieldTypeLastname = 2,
/// Represents username field of contacts
  CPAddressBookFieldTypeUsername = 3,
/// Represents phone number field of contacts
  CPAddressBookFieldTypePhoneNumber = 4,
};

/// Specifies order type for the directory search.
/// Should be used while specifying order rule while performing search operation.
/// since:
/// 1.0.0
typedef SWIFT_ENUM_NAMED(NSInteger, CPAddressBookOrderType, "OrderType", closed) {
/// Search results will be listed in ascending order
  CPAddressBookOrderTypeAscending = 0,
/// Search results will be listed in descending order
  CPAddressBookOrderTypeDescending = 1,
};


/// Manages address book lists.
/// since:
/// 1.0.0
SWIFT_CLASS("_TtC20CPAddressBookService17CPAddressBookList")
@interface CPAddressBookList : NSObject
/// Identifier or name of the list.
@property (nonatomic, copy) NSString * _Nonnull listId;
/// Resource URL of the address book list.
@property (nonatomic, copy) NSString * _Nonnull resourceUrl;
/// Initializes CPAddressBookList object with the specified list Id.
/// \param listId Unique identifier for the CPAddressBook List Object.
///
- (nonnull instancetype)initWithListId:(NSString * _Nonnull)listId OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class CPContact;
@class CPError;
@class CPSearch;
@class CPSearchResult;
@class CPServiceInfo;

/// Store, manage and search contacts through address books, lists and directories.
/// since:
/// 1.0.0
SWIFT_CLASS("_TtC20CPAddressBookService20CPAddressBookService")
@interface CPAddressBookService : NSObject <CPServiceProtocol>
/// This method is for adding a contact to user’s addressbook directory
/// since:
/// 1.0.0
/// \param contact contact information that is going to be added to user’s addressbook
///
/// \param completion completion block for adding contact
///
- (void)addContactWithAddressBookId:(NSString * _Nonnull)addressBookId contact:(CPContact * _Nonnull)contact completion:(void (^ _Nonnull)(CPError * _Nullable))completion;
/// This method is for updating(editing) a contact which is already in user’s addressbook directory
/// since:
/// 1.0.0
/// \param contact contact information that is going to be added to user’s addressbook
///
/// \param completion completion block for updating contact
///
- (void)updateContactWithAddressBookId:(NSString * _Nonnull)addressBookId contact:(CPContact * _Nonnull)contact completion:(void (^ _Nonnull)(CPError * _Nullable))completion;
/// This method is getting all the contacts in user’s addressbook directory
/// since:
/// 1.0.0
/// \param completion completion block for retrieving contact list
///
- (void)retrieveContactListWithAddressBookId:(NSString * _Nonnull)addressBookId completion:(void (^ _Nonnull)(CPError * _Nullable, NSArray<CPContact *> * _Nullable))completion;
/// This method is for adding a contact to user’s addressbook directory
/// since:
/// 1.0.0
/// \param contactId identifier of contact to get (identifier is defined in client side, so make sure you set it unique)
///
/// \param completion completion block for getting single contact
///
- (void)getContactWithAddressBookId:(NSString * _Nonnull)addressBookId contactId:(NSString * _Nonnull)contactId completion:(void (^ _Nonnull)(CPError * _Nullable, CPContact * _Nonnull))completion;
/// This method is for deleting a contact from user’s addressbook directory
/// since:
/// 1.0.0
/// \param identifier identifier of contact to delete (identifier is defined in client side, so make sure you set it unique)
///
/// \param completion completion block for adding contact
///
- (void)deleteContactWithAddressBookId:(NSString * _Nonnull)addressBookId identifier:(NSString * _Nonnull)identifier completion:(void (^ _Nonnull)(CPError * _Nullable))completion;
/// This method is for updating a contact’s single attribute in user’s addressbook directory
/// since:
/// 1.0.0
/// \param contactIdentifier identifier of contact to update its attribute (identifier is defined in client side, so make sure you set it unique)
///
/// \param attributeId unique Id of attribute which needs to be updated
///
/// \param attributeVal unique value of attribute which needs to be updated (this value is related with attributeId)
///
/// \param completion completion block for adding contact
///
- (void)updateAttributeWithAddressBookId:(NSString * _Nonnull)addressBookId contactIdentifier:(NSString * _Nonnull)contactIdentifier attributeId:(NSString * _Nonnull)attributeId attributeVal:(NSString * _Nonnull)attributeVal completion:(void (^ _Nonnull)(CPError * _Nullable))completion;
/// This method is for removing a contact’s single attribute
/// since:
/// 1.0.0
/// \param contactIdentifier identifier of contact’s attribute to remove (identifier is defined in client side, so make sure you set it unique)
///
/// \param attributeId unique Id of attribute which needs to be removed
///
/// \param completion completion block for adding contact
///
- (void)removeAttributeWithAddressBookId:(NSString * _Nonnull)addressBookId contactIdentifier:(NSString * _Nonnull)contactIdentifier attributeId:(NSString * _Nonnull)attributeId completion:(void (^ _Nonnull)(CPError * _Nullable))completion;
/// This method is getting all the contact lists in user’s addressbook directory
/// since:
/// 1.0.0
/// \param completion completion block for retrieving all contact lists
///
- (void)retrieveAddressBookListWithAddressBookId:(NSString * _Nonnull)addressBookId completion:(void (^ _Nonnull)(CPError * _Nullable, NSArray<CPAddressBookList *> * _Nullable))completion;
/// This method is for adding a contact list to user’s addressbook directory
/// since:
/// 1.0.0
/// \param addressbookId id of the addressbook which the operation  will apply to
///
/// \param addressbookList contact list information that is going to be added to user’s addressbook
///
/// \param completion completion block for adding contact list
///
- (void)addAddressBookListWithAddressBookId:(NSString * _Nonnull)addressBookId addressbookList:(CPAddressBookList * _Nonnull)addressbookList completion:(void (^ _Nonnull)(CPError * _Nullable, CPAddressBookList * _Nullable))completion;
/// This method is for editing a contact list in user’s addressbook directory
/// since:
/// 1.0.0
/// \param addressbookId id of the addressbook which the operation  will apply to
///
/// \param oldListId id of the old addressbook which is going to be replaced by the new one
///
/// \param addressbookList contact list information that is going to be edited in the user’s addressbook
///
/// \param completion completion block for editing contact list
///
- (void)updateAddressBookListWithAddressBookId:(NSString * _Nonnull)addressBookId oldListId:(NSString * _Nonnull)oldListId addressbookList:(CPAddressBookList * _Nonnull)addressbookList completion:(void (^ _Nonnull)(CPError * _Nullable, CPAddressBookList * _Nullable))completion;
/// This method is for deleting a contact list from user’s addressbook directory
/// since:
/// 1.0.0
/// \param addressbookId id of the addressbook which the operation  will apply to
///
/// \param listId identifier of contact list to delete (identifier is defined in client side, so make sure you set it unique)
///
/// \param completion completion block for deleting contact
///
- (void)deleteAddressBookListWithAddressBookId:(NSString * _Nonnull)addressBookId listId:(NSString * _Nonnull)listId completion:(void (^ _Nonnull)(CPError * _Nullable))completion;
/// This method is for getting a contact list in user’s addressbook directory
/// since:
/// 1.0.0
/// \param addressbookId id of the addressbook which the operation  will apply to
///
/// \param listId identifier of contact list to get (identifier is defined in client side, so make sure you set it unique)
///
/// \param completion completion block for getting single contact
///
- (void)getAddressBookListWithAddressBookId:(NSString * _Nonnull)addressBookId listId:(NSString * _Nonnull)listId completion:(void (^ _Nonnull)(CPError * _Nullable, CPAddressBookList * _Nullable))completion;
/// Searches Directory with the given parameters.
/// since:
/// 1.0.0
/// \param search CPSearch object that contains necessary informations for directory search.
///
/// \param completion Completion block for search results. Returns <em>CPSearchResult</em> object, or error if any occurs.
///
- (void)searchWith:(CPSearch * _Nonnull)search completion:(void (^ _Nonnull)(CPError * _Nullable, CPSearchResult * _Nullable))completion;
/// Delegate method to get a service’s information
///
/// returns:
/// service information object with service type and preferences.
- (CPServiceInfo * _Nonnull)serviceInfo SWIFT_WARN_UNUSED_RESULT;
- (void)subscribeWithChannelID:(NSString * _Nonnull)channelID completion:(void (^ _Nonnull)(NSString * _Nonnull, CPError * _Nullable))completion;
- (void)unsubscribeWithChannelID:(NSString * _Nonnull)channelID completion:(void (^ _Nonnull)(CPError * _Nullable))completion;
/// Delegate method to get a list of notfications the service expects
///
/// returns:
/// list of notification names. These should match what is returned by subscribe() in completion callback.
- (NSArray<NSString *> * _Nonnull)notifications SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


/// Holds the information about the selected contact.
SWIFT_CLASS("_TtC20CPAddressBookService9CPContact")
@interface CPContact : NSObject
/// The unique identifier of the selected contact
@property (nonatomic, copy) NSString * _Nonnull contactId;
/// The firstname of the user
@property (nonatomic, copy) NSString * _Nonnull firstName;
/// The lastname of the user
@property (nonatomic, copy) NSString * _Nonnull lastName;
/// The email address of the user
@property (nonatomic, copy) NSString * _Nonnull email;
/// The homePhoneNumber attribute of the user
@property (nonatomic, copy) NSString * _Nonnull homePhoneNumber;
/// The businessPhoneNumber attribute of the user
@property (nonatomic, copy) NSString * _Nonnull businessPhoneNumber;
/// The fax number attribute of the user
@property (nonatomic, copy) NSString * _Nonnull fax;
/// The mobile phoneNumber attribute of the user
@property (nonatomic, copy) NSString * _Nonnull mobile;
/// The pager number attribute of the user
@property (nonatomic, copy) NSString * _Nonnull pager;
/// This parameter defines if the user is part of friends group
@property (nonatomic) BOOL buddy;
/// The photoUrl of the contact
@property (nonatomic, readonly, copy) NSString * _Nonnull photoUrl;
/// The conferenceUrl attribute of the contact
@property (nonatomic, readonly, copy) NSString * _Nonnull conferenceUrl;
/// Unique username parameter for the contact
@property (nonatomic, copy) NSString * _Nonnull username;
/// The id of the contact lists which the contact is belong to
@property (nonatomic, copy) NSArray<CPAddressBookList *> * _Nonnull lists;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
/// Initializes Contact object with the specified contact Id.
/// \param contactId Unique identifier for the Contact Object.
///
- (nonnull instancetype)initWithContactId:(NSString * _Nonnull)contactId OBJC_DESIGNATED_INITIALIZER;
@end

@class CPSearchFilter;

/// Contains necessary information when <em>search</em> will be used.
SWIFT_CLASS("_TtC20CPAddressBookService8CPSearch")
@interface CPSearch : NSObject
/// Tells which keyword will be searched in the specified field type.
@property (nonatomic, strong) CPSearchFilter * _Nonnull filter;
/// Sorts result according to the specified field type. If any field type
/// not specified, will be same with the <em>filter</em> field type in the initialization phase.
@property (nonatomic) enum CPAddressBookFieldType sortBy;
/// Orders results according to the specified type. <em>Default</em> value is <em>ascending</em>.
@property (nonatomic) enum CPAddressBookOrderType orderBy;
/// Specifies the maximum number of contacts will return from the result.
/// If search query has more than specified <em>limit</em>, can be check <em>hasNext</em> property
/// of the <em>CPSearchResult</em> object to get next chunk of results.
@property (nonatomic) NSInteger limit;
/// Specifies which directory will be searched
/// <em>Default</em> value is “default”
@property (nonatomic, copy) NSString * _Nonnull directoryId;
/// Initializes with the specified <em>CPSearchFilter</em> object
/// \param filter <em>CPSearchFilter</em> object which contains keyword and the
/// field of search.
///
- (nonnull instancetype)initWithFilter:(CPSearchFilter * _Nonnull)filter OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


/// Contains key-value pair for directory search which specifies
/// keyword for search and the field type where to search of contacts
SWIFT_CLASS("_TtC20CPAddressBookService14CPSearchFilter")
@interface CPSearchFilter : NSObject
/// Type of the filter field.
@property (nonatomic, readonly) enum CPAddressBookFieldType type;
/// Value of the field.
@property (nonatomic, readonly, copy) NSString * _Null_unspecified value;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
/// Initializes Search Filter object with the specified keyword(value) and the field type.
/// \param value Specifies keyword for directory search operations.
///
/// \param forType Specifies field type of search operations.
///
- (nonnull instancetype)initWithValue:(NSString * _Nonnull)value forType:(enum CPAddressBookFieldType)forType OBJC_DESIGNATED_INITIALIZER;
@end


/// Contains information about the directory search results.
SWIFT_CLASS("_TtC20CPAddressBookService14CPSearchResult")
@interface CPSearchResult : NSObject
/// Returns relevant contacts to directory search result if any founds.
@property (nonatomic, readonly, copy) NSArray<CPContact *> * _Nullable contacts;
/// If limit is defined in the <em>CPSearch</em> object and number of relevant results exceeds,
/// returns <em>true</em>, otherwise <em>false</em>.
/// important:
/// Should be checked before <em>getNext:completion</em> if used.
@property (nonatomic, readonly) BOOL hasNext;
/// Returns next chunk of contacts if any left.
/// \param completion Returns new <em>CPSearchResult</em> object with updated results
///
- (void)getNextWithCompletion:(void (^ _Nonnull)(CPError * _Nullable, CPSearchResult * _Nullable))completion;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
