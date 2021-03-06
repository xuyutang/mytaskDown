// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "User.pb.h"

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
@class Print;
@class PrintParams;
@class PrintParams_Builder;
@class Print_Builder;
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


@interface PrintRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface Print : PBGeneratedMessage {
@private
  BOOL hasContent_:1;
  NSString* content;
}
- (BOOL) hasContent;
@property (readonly, retain) NSString* content;

+ (Print*) defaultInstance;
- (Print*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Print_Builder*) builder;
+ (Print_Builder*) builder;
+ (Print_Builder*) builderWithPrototype:(Print*) prototype;
- (Print_Builder*) toBuilder;

+ (Print*) parseFromData:(NSData*) data;
+ (Print*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Print*) parseFromInputStream:(NSInputStream*) input;
+ (Print*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Print*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Print*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Print_Builder : PBGeneratedMessage_Builder {
@private
  Print* result;
}

- (Print*) defaultInstance;

- (Print_Builder*) clear;
- (Print_Builder*) clone;

- (Print*) build;
- (Print*) buildPartial;

- (Print_Builder*) mergeFrom:(Print*) other;
- (Print_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Print_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasContent;
- (NSString*) content;
- (Print_Builder*) setContent:(NSString*) value;
- (Print_Builder*) clearContent;
@end

@interface PrintParams : PBGeneratedMessage {
@private
  BOOL hasOrderId_:1;
  int32_t orderId;
}
- (BOOL) hasOrderId;
@property (readonly) int32_t orderId;

+ (PrintParams*) defaultInstance;
- (PrintParams*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (PrintParams_Builder*) builder;
+ (PrintParams_Builder*) builder;
+ (PrintParams_Builder*) builderWithPrototype:(PrintParams*) prototype;
- (PrintParams_Builder*) toBuilder;

+ (PrintParams*) parseFromData:(NSData*) data;
+ (PrintParams*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PrintParams*) parseFromInputStream:(NSInputStream*) input;
+ (PrintParams*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (PrintParams*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (PrintParams*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface PrintParams_Builder : PBGeneratedMessage_Builder {
@private
  PrintParams* result;
}

- (PrintParams*) defaultInstance;

- (PrintParams_Builder*) clear;
- (PrintParams_Builder*) clone;

- (PrintParams*) build;
- (PrintParams*) buildPartial;

- (PrintParams_Builder*) mergeFrom:(PrintParams*) other;
- (PrintParams_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (PrintParams_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasOrderId;
- (int32_t) orderId;
- (PrintParams_Builder*) setOrderId:(int32_t) value;
- (PrintParams_Builder*) clearOrderId;
@end

