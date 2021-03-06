// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

#import "Generic.pb.h"

@class AppSetting;
@class AppSetting_Builder;
@class Function;
@class Function_Builder;
@class Location;
@class Location_Builder;
@class Log;
@class Log_Builder;
@class Pagination;
@class Pagination_Builder;
@class SystemSetting;
@class SystemSetting_Builder;
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

typedef enum {
  LogTypeLogin = 0,
  LogTypeLogout = 1,
} LogType;

BOOL LogTypeIsValidValue(LogType value);


@interface LogRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface Log : PBGeneratedMessage {
@private
  BOOL hasType_:1;
  BOOL hasContent_:1;
  BOOL hasLocation_:1;
  NSString* type;
  NSString* content;
  Location* location;
}
- (BOOL) hasLocation;
- (BOOL) hasType;
- (BOOL) hasContent;
@property (readonly, retain) Location* location;
@property (readonly, retain) NSString* type;
@property (readonly, retain) NSString* content;

+ (Log*) defaultInstance;
- (Log*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Log_Builder*) builder;
+ (Log_Builder*) builder;
+ (Log_Builder*) builderWithPrototype:(Log*) prototype;
- (Log_Builder*) toBuilder;

+ (Log*) parseFromData:(NSData*) data;
+ (Log*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Log*) parseFromInputStream:(NSInputStream*) input;
+ (Log*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Log*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Log*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Log_Builder : PBGeneratedMessage_Builder {
@private
  Log* result;
}

- (Log*) defaultInstance;

- (Log_Builder*) clear;
- (Log_Builder*) clone;

- (Log*) build;
- (Log*) buildPartial;

- (Log_Builder*) mergeFrom:(Log*) other;
- (Log_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Log_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasLocation;
- (Location*) location;
- (Log_Builder*) setLocation:(Location*) value;
- (Log_Builder*) setLocationBuilder:(Location_Builder*) builderForValue;
- (Log_Builder*) mergeLocation:(Location*) value;
- (Log_Builder*) clearLocation;

- (BOOL) hasType;
- (NSString*) type;
- (Log_Builder*) setType:(NSString*) value;
- (Log_Builder*) clearType;

- (BOOL) hasContent;
- (NSString*) content;
- (Log_Builder*) setContent:(NSString*) value;
- (Log_Builder*) clearContent;
@end

