// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "Generic.pb.h"

@class AppSetting;
@class AppSetting_Builder;
@class Company;
@class Company_Builder;
@class Department;
@class Department_Builder;
@class Device;
@class Device_Builder;
@class Function;
@class Function_Builder;
@class Location;
@class Location_Builder;
@class PageUser;
@class PageUser_Builder;
@class Pagination;
@class Pagination_Builder;
@class Permission;
@class Permission_Builder;
@class Position;
@class Position_Builder;
@class SystemSetting;
@class SystemSetting_Builder;
@class User;
@class UserParams;
@class UserParams_Builder;
@class User_Builder;
#ifndef __has_feature
  #define __has_feature(x) 0 // Compatibility with non-clang compilers.
#endif // __has_feature

#ifndef NS_RETURNS_NOT_RETAINED
  #if __has_feature(attribute_ns_returns_not_retained)
    #define NS_RETURNS_NOT_RETAINED __attribute__((ns_returns_not_retained))
  #else
    #define NS_RETURNS_NOT_RETAINED
  #endif
#endif


@interface UserRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface User : PBGeneratedMessage {
@private
  BOOL hasId_:1;
  BOOL hasExpiredMessage_:1;
  BOOL hasCountData_:1;
  BOOL hasRoleType_:1;
  BOOL hasExpired_:1;
  BOOL hasSpell_:1;
  BOOL hasEntryTime_:1;
  BOOL hasNewPwd_:1;
  BOOL hasGender_:1;
  BOOL hasRealName_:1;
  BOOL hasEmail_:1;
  BOOL hasPassword_:1;
  BOOL hasUserName_:1;
  BOOL hasPosition_:1;
  BOOL hasDepartment_:1;
  BOOL hasCompany_:1;
  BOOL hasLocation_:1;
  BOOL hasDevice_:1;
  BOOL hasPermission_:1;
  int32_t id;
  NSString* expiredMessage;
  NSString* countData;
  NSString* roleType;
  NSString* expired;
  NSString* spell;
  NSString* entryTime;
  NSString* newPwd;
  NSString* gender;
  NSString* realName;
  NSString* email;
  NSString* password;
  NSString* userName;
  Position* position;
  Department* department;
  Company* company;
  Location* location;
  Device* device;
  Permission* permission;
  PBAppendableArray * avatarsArray;
  PBAppendableArray * devicesArray;
  PBAppendableArray * avatarFileArray;
}
- (BOOL) hasId;
- (BOOL) hasUserName;
- (BOOL) hasPassword;
- (BOOL) hasEmail;
- (BOOL) hasRealName;
- (BOOL) hasGender;
- (BOOL) hasNewPwd;
- (BOOL) hasEntryTime;
- (BOOL) hasPosition;
- (BOOL) hasDepartment;
- (BOOL) hasCompany;
- (BOOL) hasSpell;
- (BOOL) hasExpired;
- (BOOL) hasLocation;
- (BOOL) hasRoleType;
- (BOOL) hasDevice;
- (BOOL) hasCountData;
- (BOOL) hasPermission;
- (BOOL) hasExpiredMessage;
@property (readonly) int32_t id;
@property (readonly, retain) NSString* userName;
@property (readonly, retain) NSString* password;
@property (readonly, retain) NSString* email;
@property (readonly, retain) NSString* realName;
@property (readonly, retain) NSString* gender;
@property (readonly, retain) NS_RETURNS_NOT_RETAINED NSString* newPwd;
@property (readonly, retain) PBArray * avatarFile;
@property (readonly, retain) PBArray * avatars;
@property (readonly, retain) NSString* entryTime;
@property (readonly, retain) Position* position;
@property (readonly, retain) Department* department;
@property (readonly, retain) Company* company;
@property (readonly, retain) NSString* spell;
@property (readonly, retain) NSString* expired;
@property (readonly, retain) Location* location;
@property (readonly, retain) NSString* roleType;
@property (readonly, retain) Device* device;
@property (readonly, retain) NSString* countData;
@property (readonly, retain) PBArray * devices;
@property (readonly, retain) Permission* permission;
@property (readonly, retain) NSString* expiredMessage;
- (NSData*)avatarFileAtIndex:(NSUInteger)index;
- (NSString*)avatarsAtIndex:(NSUInteger)index;
- (Device*)devicesAtIndex:(NSUInteger)index;

+ (User*) defaultInstance;
- (User*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (User_Builder*) builder;
+ (User_Builder*) builder;
+ (User_Builder*) builderWithPrototype:(User*) prototype;
- (User_Builder*) toBuilder;

+ (User*) parseFromData:(NSData*) data;
+ (User*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (User*) parseFromInputStream:(NSInputStream*) input;
+ (User*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (User*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (User*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface User_Builder : PBGeneratedMessage_Builder {
@private
  User* result;
}

- (User*) defaultInstance;

- (User_Builder*) clear;
- (User_Builder*) clone;

- (User*) build;
- (User*) buildPartial;

- (User_Builder*) mergeFrom:(User*) other;
- (User_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (User_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasId;
- (int32_t) id;
- (User_Builder*) setId:(int32_t) value;
- (User_Builder*) clearId;

- (BOOL) hasUserName;
- (NSString*) userName;
- (User_Builder*) setUserName:(NSString*) value;
- (User_Builder*) clearUserName;

- (BOOL) hasPassword;
- (NSString*) password;
- (User_Builder*) setPassword:(NSString*) value;
- (User_Builder*) clearPassword;

- (BOOL) hasEmail;
- (NSString*) email;
- (User_Builder*) setEmail:(NSString*) value;
- (User_Builder*) clearEmail;

- (BOOL) hasRealName;
- (NSString*) realName;
- (User_Builder*) setRealName:(NSString*) value;
- (User_Builder*) clearRealName;

- (BOOL) hasGender;
- (NSString*) gender;
- (User_Builder*) setGender:(NSString*) value;
- (User_Builder*) clearGender;

- (BOOL) hasNewPwd;
- (NSString*) newPwd NS_RETURNS_NOT_RETAINED;
- (User_Builder*) setNewPwd:(NSString*) value;
- (User_Builder*) clearNewPwd;

- (PBAppendableArray *)avatarFile;
- (NSData*)avatarFileAtIndex:(NSUInteger)index;
- (User_Builder *)addAvatarFile:(NSData*)value;
- (User_Builder *)setAvatarFileArray:(NSArray *)array;
- (User_Builder *)setAvatarFileValues:(const NSData* *)values count:(NSUInteger)count;
- (User_Builder *)clearAvatarFile;

- (PBAppendableArray *)avatars;
- (NSString*)avatarsAtIndex:(NSUInteger)index;
- (User_Builder *)addAvatars:(NSString*)value;
- (User_Builder *)setAvatarsArray:(NSArray *)array;
- (User_Builder *)setAvatarsValues:(const NSString* *)values count:(NSUInteger)count;
- (User_Builder *)clearAvatars;

- (BOOL) hasEntryTime;
- (NSString*) entryTime;
- (User_Builder*) setEntryTime:(NSString*) value;
- (User_Builder*) clearEntryTime;

- (BOOL) hasPosition;
- (Position*) position;
- (User_Builder*) setPosition:(Position*) value;
- (User_Builder*) setPositionBuilder:(Position_Builder*) builderForValue;
- (User_Builder*) mergePosition:(Position*) value;
- (User_Builder*) clearPosition;

- (BOOL) hasDepartment;
- (Department*) department;
- (User_Builder*) setDepartment:(Department*) value;
- (User_Builder*) setDepartmentBuilder:(Department_Builder*) builderForValue;
- (User_Builder*) mergeDepartment:(Department*) value;
- (User_Builder*) clearDepartment;

- (BOOL) hasCompany;
- (Company*) company;
- (User_Builder*) setCompany:(Company*) value;
- (User_Builder*) setCompanyBuilder:(Company_Builder*) builderForValue;
- (User_Builder*) mergeCompany:(Company*) value;
- (User_Builder*) clearCompany;

- (BOOL) hasSpell;
- (NSString*) spell;
- (User_Builder*) setSpell:(NSString*) value;
- (User_Builder*) clearSpell;

- (BOOL) hasExpired;
- (NSString*) expired;
- (User_Builder*) setExpired:(NSString*) value;
- (User_Builder*) clearExpired;

- (BOOL) hasLocation;
- (Location*) location;
- (User_Builder*) setLocation:(Location*) value;
- (User_Builder*) setLocationBuilder:(Location_Builder*) builderForValue;
- (User_Builder*) mergeLocation:(Location*) value;
- (User_Builder*) clearLocation;

- (BOOL) hasRoleType;
- (NSString*) roleType;
- (User_Builder*) setRoleType:(NSString*) value;
- (User_Builder*) clearRoleType;

- (BOOL) hasDevice;
- (Device*) device;
- (User_Builder*) setDevice:(Device*) value;
- (User_Builder*) setDeviceBuilder:(Device_Builder*) builderForValue;
- (User_Builder*) mergeDevice:(Device*) value;
- (User_Builder*) clearDevice;

- (BOOL) hasCountData;
- (NSString*) countData;
- (User_Builder*) setCountData:(NSString*) value;
- (User_Builder*) clearCountData;

- (PBAppendableArray *)devices;
- (Device*)devicesAtIndex:(NSUInteger)index;
- (User_Builder *)addDevices:(Device*)value;
- (User_Builder *)setDevicesArray:(NSArray *)array;
- (User_Builder *)setDevicesValues:(const Device* *)values count:(NSUInteger)count;
- (User_Builder *)clearDevices;

- (BOOL) hasPermission;
- (Permission*) permission;
- (User_Builder*) setPermission:(Permission*) value;
- (User_Builder*) setPermissionBuilder:(Permission_Builder*) builderForValue;
- (User_Builder*) mergePermission:(Permission*) value;
- (User_Builder*) clearPermission;

- (BOOL) hasExpiredMessage;
- (NSString*) expiredMessage;
- (User_Builder*) setExpiredMessage:(NSString*) value;
- (User_Builder*) clearExpiredMessage;
@end

@interface PageUser : PBGeneratedMessage {
@private
  BOOL hasPage_:1;
  Pagination* page;
  PBAppendableArray * usersArray;
}
- (BOOL) hasPage;
@property (readonly, retain) Pagination* page;
@property (readonly, retain) PBArray * users;
- (User*)usersAtIndex:(NSUInteger)index;

+ (PageUser*) defaultInstance;
- (PageUser*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PageUser_Builder*) builder;
+ (PageUser_Builder*) builder;
+ (PageUser_Builder*) builderWithPrototype:(PageUser*) prototype;
- (PageUser_Builder*) toBuilder;

+ (PageUser*) parseFromData:(NSData*) data;
+ (PageUser*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PageUser*) parseFromInputStream:(NSInputStream*) input;
+ (PageUser*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PageUser*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PageUser*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PageUser_Builder : PBGeneratedMessage_Builder {
@private
  PageUser* result;
}

- (PageUser*) defaultInstance;

- (PageUser_Builder*) clear;
- (PageUser_Builder*) clone;

- (PageUser*) build;
- (PageUser*) buildPartial;

- (PageUser_Builder*) mergeFrom:(PageUser*) other;
- (PageUser_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PageUser_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasPage;
- (Pagination*) page;
- (PageUser_Builder*) setPage:(Pagination*) value;
- (PageUser_Builder*) setPageBuilder:(Pagination_Builder*) builderForValue;
- (PageUser_Builder*) mergePage:(Pagination*) value;
- (PageUser_Builder*) clearPage;

- (PBAppendableArray *)users;
- (User*)usersAtIndex:(NSUInteger)index;
- (PageUser_Builder *)addUsers:(User*)value;
- (PageUser_Builder *)setUsersArray:(NSArray *)array;
- (PageUser_Builder *)setUsersValues:(const User* *)values count:(NSUInteger)count;
- (PageUser_Builder *)clearUsers;
@end

@interface UserParams : PBGeneratedMessage {
@private
  BOOL hasTag_:1;
  BOOL hasPage_:1;
  BOOL hasUser_:1;
  BOOL hasLocation_:1;
  BOOL tag_:1;
  int32_t page;
  User* user;
  Location* location;
  PBAppendableArray * departmentArray;
}
- (BOOL) hasPage;
- (BOOL) hasUser;
- (BOOL) hasLocation;
- (BOOL) hasTag;
@property (readonly) int32_t page;
@property (readonly, retain) User* user;
@property (readonly, retain) Location* location;
@property (readonly, retain) PBArray * department;
- (BOOL) tag;
- (Department*)departmentAtIndex:(NSUInteger)index;

+ (UserParams*) defaultInstance;
- (UserParams*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (UserParams_Builder*) builder;
+ (UserParams_Builder*) builder;
+ (UserParams_Builder*) builderWithPrototype:(UserParams*) prototype;
- (UserParams_Builder*) toBuilder;

+ (UserParams*) parseFromData:(NSData*) data;
+ (UserParams*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (UserParams*) parseFromInputStream:(NSInputStream*) input;
+ (UserParams*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (UserParams*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (UserParams*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface UserParams_Builder : PBGeneratedMessage_Builder {
@private
  UserParams* result;
}

- (UserParams*) defaultInstance;

- (UserParams_Builder*) clear;
- (UserParams_Builder*) clone;

- (UserParams*) build;
- (UserParams*) buildPartial;

- (UserParams_Builder*) mergeFrom:(UserParams*) other;
- (UserParams_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (UserParams_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasPage;
- (int32_t) page;
- (UserParams_Builder*) setPage:(int32_t) value;
- (UserParams_Builder*) clearPage;

- (BOOL) hasUser;
- (User*) user;
- (UserParams_Builder*) setUser:(User*) value;
- (UserParams_Builder*) setUserBuilder:(User_Builder*) builderForValue;
- (UserParams_Builder*) mergeUser:(User*) value;
- (UserParams_Builder*) clearUser;

- (BOOL) hasLocation;
- (Location*) location;
- (UserParams_Builder*) setLocation:(Location*) value;
- (UserParams_Builder*) setLocationBuilder:(Location_Builder*) builderForValue;
- (UserParams_Builder*) mergeLocation:(Location*) value;
- (UserParams_Builder*) clearLocation;

- (PBAppendableArray *)department;
- (Department*)departmentAtIndex:(NSUInteger)index;
- (UserParams_Builder *)addDepartment:(Department*)value;
- (UserParams_Builder *)setDepartmentArray:(NSArray *)array;
- (UserParams_Builder *)setDepartmentValues:(const Department* *)values count:(NSUInteger)count;
- (UserParams_Builder *)clearDepartment;

- (BOOL) hasTag;
- (BOOL) tag;
- (UserParams_Builder*) setTag:(BOOL) value;
- (UserParams_Builder*) clearTag;
@end

@interface Permission : PBGeneratedMessage {
@private
  BOOL hasName_:1;
  BOOL hasValue_:1;
  NSString* name;
  NSString* value;
}
- (BOOL) hasName;
- (BOOL) hasValue;
@property (readonly, retain) NSString* name;
@property (readonly, retain) NSString* value;

+ (Permission*) defaultInstance;
- (Permission*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Permission_Builder*) builder;
+ (Permission_Builder*) builder;
+ (Permission_Builder*) builderWithPrototype:(Permission*) prototype;
- (Permission_Builder*) toBuilder;

+ (Permission*) parseFromData:(NSData*) data;
+ (Permission*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Permission*) parseFromInputStream:(NSInputStream*) input;
+ (Permission*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Permission*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Permission*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Permission_Builder : PBGeneratedMessage_Builder {
@private
  Permission* result;
}

- (Permission*) defaultInstance;

- (Permission_Builder*) clear;
- (Permission_Builder*) clone;

- (Permission*) build;
- (Permission*) buildPartial;

- (Permission_Builder*) mergeFrom:(Permission*) other;
- (Permission_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Permission_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (Permission_Builder*) setName:(NSString*) value;
- (Permission_Builder*) clearName;

- (BOOL) hasValue;
- (NSString*) value;
- (Permission_Builder*) setValue:(NSString*) value;
- (Permission_Builder*) clearValue;
@end

@interface Department : PBGeneratedMessage {
@private
  BOOL hasId_:1;
  BOOL hasParentId_:1;
  BOOL hasSortId_:1;
  BOOL hasName_:1;
  int32_t id;
  int32_t parentId;
  int32_t sortId;
  NSString* name;
}
- (BOOL) hasId;
- (BOOL) hasName;
- (BOOL) hasParentId;
- (BOOL) hasSortId;
@property (readonly) int32_t id;
@property (readonly, retain) NSString* name;
@property (readonly) int32_t parentId;
@property (readonly) int32_t sortId;

+ (Department*) defaultInstance;
- (Department*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Department_Builder*) builder;
+ (Department_Builder*) builder;
+ (Department_Builder*) builderWithPrototype:(Department*) prototype;
- (Department_Builder*) toBuilder;

+ (Department*) parseFromData:(NSData*) data;
+ (Department*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Department*) parseFromInputStream:(NSInputStream*) input;
+ (Department*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Department*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Department*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Department_Builder : PBGeneratedMessage_Builder {
@private
  Department* result;
}

- (Department*) defaultInstance;

- (Department_Builder*) clear;
- (Department_Builder*) clone;

- (Department*) build;
- (Department*) buildPartial;

- (Department_Builder*) mergeFrom:(Department*) other;
- (Department_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Department_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasId;
- (int32_t) id;
- (Department_Builder*) setId:(int32_t) value;
- (Department_Builder*) clearId;

- (BOOL) hasName;
- (NSString*) name;
- (Department_Builder*) setName:(NSString*) value;
- (Department_Builder*) clearName;

- (BOOL) hasParentId;
- (int32_t) parentId;
- (Department_Builder*) setParentId:(int32_t) value;
- (Department_Builder*) clearParentId;

- (BOOL) hasSortId;
- (int32_t) sortId;
- (Department_Builder*) setSortId:(int32_t) value;
- (Department_Builder*) clearSortId;
@end

@interface Position : PBGeneratedMessage {
@private
  BOOL hasId_:1;
  BOOL hasName_:1;
  int32_t id;
  NSString* name;
}
- (BOOL) hasId;
- (BOOL) hasName;
@property (readonly) int32_t id;
@property (readonly, retain) NSString* name;

+ (Position*) defaultInstance;
- (Position*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Position_Builder*) builder;
+ (Position_Builder*) builder;
+ (Position_Builder*) builderWithPrototype:(Position*) prototype;
- (Position_Builder*) toBuilder;

+ (Position*) parseFromData:(NSData*) data;
+ (Position*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Position*) parseFromInputStream:(NSInputStream*) input;
+ (Position*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Position*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Position*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Position_Builder : PBGeneratedMessage_Builder {
@private
  Position* result;
}

- (Position*) defaultInstance;

- (Position_Builder*) clear;
- (Position_Builder*) clone;

- (Position*) build;
- (Position*) buildPartial;

- (Position_Builder*) mergeFrom:(Position*) other;
- (Position_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Position_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasId;
- (int32_t) id;
- (Position_Builder*) setId:(int32_t) value;
- (Position_Builder*) clearId;

- (BOOL) hasName;
- (NSString*) name;
- (Position_Builder*) setName:(NSString*) value;
- (Position_Builder*) clearName;
@end

@interface Company : PBGeneratedMessage {
@private
  BOOL hasId_:1;
  BOOL hasName_:1;
  BOOL hasDesc_:1;
  BOOL hasIdea_:1;
  NSString* id;
  NSString* name;
  NSString* desc;
  NSString* idea;
  PBAppendableArray * filePathArray;
  PBAppendableArray * filesArray;
}
- (BOOL) hasId;
- (BOOL) hasName;
- (BOOL) hasDesc;
- (BOOL) hasIdea;
@property (readonly, retain) NSString* id;
@property (readonly, retain) NSString* name;
@property (readonly, retain) NSString* desc;
@property (readonly, retain) NSString* idea;
@property (readonly, retain) PBArray * files;
@property (readonly, retain) PBArray * filePath;
- (NSData*)filesAtIndex:(NSUInteger)index;
- (NSString*)filePathAtIndex:(NSUInteger)index;

+ (Company*) defaultInstance;
- (Company*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Company_Builder*) builder;
+ (Company_Builder*) builder;
+ (Company_Builder*) builderWithPrototype:(Company*) prototype;
- (Company_Builder*) toBuilder;

+ (Company*) parseFromData:(NSData*) data;
+ (Company*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Company*) parseFromInputStream:(NSInputStream*) input;
+ (Company*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Company*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Company*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Company_Builder : PBGeneratedMessage_Builder {
@private
  Company* result;
}

- (Company*) defaultInstance;

- (Company_Builder*) clear;
- (Company_Builder*) clone;

- (Company*) build;
- (Company*) buildPartial;

- (Company_Builder*) mergeFrom:(Company*) other;
- (Company_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Company_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasId;
- (NSString*) id;
- (Company_Builder*) setId:(NSString*) value;
- (Company_Builder*) clearId;

- (BOOL) hasName;
- (NSString*) name;
- (Company_Builder*) setName:(NSString*) value;
- (Company_Builder*) clearName;

- (BOOL) hasDesc;
- (NSString*) desc;
- (Company_Builder*) setDesc:(NSString*) value;
- (Company_Builder*) clearDesc;

- (BOOL) hasIdea;
- (NSString*) idea;
- (Company_Builder*) setIdea:(NSString*) value;
- (Company_Builder*) clearIdea;

- (PBAppendableArray *)files;
- (NSData*)filesAtIndex:(NSUInteger)index;
- (Company_Builder *)addFiles:(NSData*)value;
- (Company_Builder *)setFilesArray:(NSArray *)array;
- (Company_Builder *)setFilesValues:(const NSData* *)values count:(NSUInteger)count;
- (Company_Builder *)clearFiles;

- (PBAppendableArray *)filePath;
- (NSString*)filePathAtIndex:(NSUInteger)index;
- (Company_Builder *)addFilePath:(NSString*)value;
- (Company_Builder *)setFilePathArray:(NSArray *)array;
- (Company_Builder *)setFilePathValues:(const NSString* *)values count:(NSUInteger)count;
- (Company_Builder *)clearFilePath;
@end

@interface Device : PBGeneratedMessage {
@private
  BOOL hasAppVersionCode_:1;
  BOOL hasAppVersion_:1;
  BOOL hasDeviceType_:1;
  BOOL hasModel_:1;
  BOOL hasOsVersion_:1;
  BOOL hasDeviceId_:1;
  BOOL hasDeviceToken_:1;
  int32_t appVersionCode;
  NSString* appVersion;
  NSString* deviceType;
  NSString* model;
  NSString* osVersion;
  NSString* deviceId;
  NSString* deviceToken;
}
- (BOOL) hasAppVersion;
- (BOOL) hasAppVersionCode;
- (BOOL) hasDeviceType;
- (BOOL) hasModel;
- (BOOL) hasOsVersion;
- (BOOL) hasDeviceId;
- (BOOL) hasDeviceToken;
@property (readonly, retain) NSString* appVersion;
@property (readonly) int32_t appVersionCode;
@property (readonly, retain) NSString* deviceType;
@property (readonly, retain) NSString* model;
@property (readonly, retain) NSString* osVersion;
@property (readonly, retain) NSString* deviceId;
@property (readonly, retain) NSString* deviceToken;

+ (Device*) defaultInstance;
- (Device*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Device_Builder*) builder;
+ (Device_Builder*) builder;
+ (Device_Builder*) builderWithPrototype:(Device*) prototype;
- (Device_Builder*) toBuilder;

+ (Device*) parseFromData:(NSData*) data;
+ (Device*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Device*) parseFromInputStream:(NSInputStream*) input;
+ (Device*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Device*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Device*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Device_Builder : PBGeneratedMessage_Builder {
@private
  Device* result;
}

- (Device*) defaultInstance;

- (Device_Builder*) clear;
- (Device_Builder*) clone;

- (Device*) build;
- (Device*) buildPartial;

- (Device_Builder*) mergeFrom:(Device*) other;
- (Device_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Device_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasAppVersion;
- (NSString*) appVersion;
- (Device_Builder*) setAppVersion:(NSString*) value;
- (Device_Builder*) clearAppVersion;

- (BOOL) hasAppVersionCode;
- (int32_t) appVersionCode;
- (Device_Builder*) setAppVersionCode:(int32_t) value;
- (Device_Builder*) clearAppVersionCode;

- (BOOL) hasDeviceType;
- (NSString*) deviceType;
- (Device_Builder*) setDeviceType:(NSString*) value;
- (Device_Builder*) clearDeviceType;

- (BOOL) hasModel;
- (NSString*) model;
- (Device_Builder*) setModel:(NSString*) value;
- (Device_Builder*) clearModel;

- (BOOL) hasOsVersion;
- (NSString*) osVersion;
- (Device_Builder*) setOsVersion:(NSString*) value;
- (Device_Builder*) clearOsVersion;

- (BOOL) hasDeviceId;
- (NSString*) deviceId;
- (Device_Builder*) setDeviceId:(NSString*) value;
- (Device_Builder*) clearDeviceId;

- (BOOL) hasDeviceToken;
- (NSString*) deviceToken;
- (Device_Builder*) setDeviceToken:(NSString*) value;
- (Device_Builder*) clearDeviceToken;
@end
