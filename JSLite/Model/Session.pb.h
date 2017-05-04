// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class SessionRequest;
@class SessionRequest_Builder;
@class SessionResponse;
@class SessionResponse_Builder;
@class Token;
@class Token_Builder;
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
    ActionTypeLogin = 0,
    ActionTypeLogout = 1,
    ActionTypeLocationSave = 2,
    ActionTypeChangePwd = 3,
    ActionTypePatrolSave = 4,
    ActionTypePatrolList = 5,
    ActionTypePatrolGet = 6,
    ActionTypePatrolReply = 7,
    ActionTypeWorklogList = 8,
    ActionTypeWorklogSave = 9,
    ActionTypeWorklogGet = 10,
    ActionTypeWorklogReply = 11,
    ActionTypeAttendanceSave = 12,
    ActionTypeAttendanceCategoryList = 13,
    ActionTypeAttendanceList = 14,
    ActionTypeAttendanceGet = 15,
    ActionTypeAttendanceReply = 16,
    ActionTypeMarketresearchSave = 17,
    ActionTypeMarketresearchList = 18,
    ActionTypeMarketresearchGet = 19,
    ActionTypeMarketresearchReply = 20,
    ActionTypeBusinessopportunitySave = 21,
    ActionTypeBusinessopportunityList = 22,
    ActionTypeBusinessopportunityGet = 23,
    ActionTypeBusinessopportunityReply = 24,
    ActionTypeApplyItemSave = 25,
    ActionTypeApplyItemList = 26,
    ActionTypeApplyItemGet = 27,
    ActionTypeApplyItemReply = 28,
    ActionTypeInspectionReportSave = 29,
    ActionTypeInspectionReportList = 30,
    ActionTypeInspectionReportGet = 31,
    ActionTypeInspectionReportReply = 32,
    ActionTypeOrdergoodsSave = 33,
    ActionTypeOrdergoodsList = 34,
    ActionTypeStockSave = 35,
    ActionTypeStockList = 36,
    ActionTypeSalegoodsSave = 37,
    ActionTypeSalegoodsList = 38,
    ActionTypeCompetitiongoodsSave = 39,
    ActionTypeCompetitiongoodsList = 40,
    ActionTypeGiftPurchaseSave = 41,
    ActionTypeGiftPurchaseList = 42,
    ActionTypeGiftPurchaseGet = 43,
    ActionTypeGiftDeliverySave = 44,
    ActionTypeGiftDeliveryList = 45,
    ActionTypeGiftDeliveryGet = 46,
    ActionTypeGiftDistributeSave = 47,
    ActionTypeGiftDistributeList = 48,
    ActionTypeGiftDistributeGet = 49,
    ActionTypeGiftStockSave = 50,
    ActionTypeGiftStockList = 51,
    ActionTypeGiftStockGet = 52,
    ActionTypeTaskPatrolGet = 53,
    ActionTypeTaskPatrolList = 54,
    ActionTypeTaskPatrolDetailSave = 55,
    ActionTypeTaskPatrolReply = 56,
    ActionTypeMyTaskPatrolList = 57,
    ActionTypeMyTaskPatrolGet = 58,
    ActionTypeMessageList = 59,
    ActionTypeAnnounceList = 60,
    ActionTypeAnnounceAck = 61,
    ActionTypeMessageAck = 62,
    ActionTypeCompanyspaceCategoryList = 63,
    ActionTypeCompanyspaceList = 64,
    ActionTypeFavSave = 65,
    ActionTypeSyncBaseData = 66,
    ActionTypeSyncCustomerList = 67,
    ActionTypeCustomerList = 68,
    ActionTypeUserList = 69,
    ActionTypeUserInfoGet = 70,
    ActionTypeCustomerInfoGet = 71,
    ActionTypeCountDataGet = 72,
    ActionTypeUserInfoUpdate = 73,
    ActionTypeCustomerSave = 74,
    ActionTypeUserLogSave = 75,
    ActionTypePushMsg = 76,
    ActionTypeCompanyContactList = 77,
    ActionTypePatrolReplyList = 78,
    ActionTypeWorklogReplyList = 79,
    ActionTypeTaskPatrolReplyList = 80,
    ActionTypeApplyItemReplyList = 81,
    ActionTypeVideoTopicSave = 82,
    ActionTypeVideoTopicList = 83,
    ActionTypeVideoTopicGet = 84,
    ActionTypeVideoTopicReply = 85,
    ActionTypeVideoTopicReplyList = 86,
    ActionTypeFavLangSave = 87,
    ActionTypeFavLangList = 88,
    ActionTypeFavLangDelete = 89,
    ActionTypeFavLangUpdate = 90,
    ActionTypePrintOrder = 91,
    ActionTypeCustomerFavList = 92,
    ActionTypeCustomerFavSave = 93,
    ActionTypeCustomerFavDelete = 94,
    ActionTypeQchatUsergroupList = 95,
    ActionTypeQchatUsergroupSave = 96,
    ActionTypeQchatUsergroupDelete = 97,
    ActionTypeQchatUsergroupUpdate = 98,
    ActionTypeQchatUserList = 99,
    ActionTypePaperPostSave = 100,
    ActionTypePaperPostList = 101,
    ActionTypePaperPostGet = 102,
    ActionTypePaperTemplateList = 103,
    ActionTypeHolidayApplySave = 104,
    ActionTypeIsExistHolidayCategoryFlow = 105,
    ActionTypeCheckinShiftGet = 106,
    ActionTypeCheckinTrackSave = 107,
    ActionTypeCheckinTrackList = 108,
    ActionTypeCheckinTrackGet = 109,
    ActionTypeCheckinTrackReply = 110,
    ActionTypeCheckinTrackReplyList = 111,
    ActionTypeCheckinWifiSave = 112,
    ActionTypeCheckinWifiList = 113,
    ActionTypeCheckinTrackDate = 114,
    ActionTypeCheckinTrackRemark = 115,
} ActionType;

BOOL ActionTypeIsValidValue(ActionType value);

typedef enum {
    ActionCodeDone = 0,
    ActionCodeErrorTimeout = 1,
    ActionCodeErrorServer = 2,
    ActionCodeErrorInvalidAction = 3,
    ActionCodeErrorAccountException = 4,
    ActionCodeErrorAppException = 5,
    ActionCodeErrorCameraCategoryInvalid = 6,
} ActionCode;

BOOL ActionCodeIsValidValue(ActionCode value);


@interface SessionRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface SessionRequest : PBGeneratedMessage {
@private
    BOOL hasSequence_:1;
    BOOL hasType_:1;
    BOOL hasToken_:1;
    BOOL hasParam_:1;
    BOOL hasData_:1;
    BOOL hasDevice_:1;
    NSString* sequence;
    NSString* type;
    Token* token;
    NSData* param;
    NSData* data;
    NSData* device;
    PBAppendableArray * datasArray;
}
- (BOOL) hasSequence;
- (BOOL) hasType;
- (BOOL) hasParam;
- (BOOL) hasData;
- (BOOL) hasToken;
- (BOOL) hasDevice;
@property (readonly, retain) NSString* sequence;
@property (readonly, retain) NSString* type;
@property (readonly, retain) NSData* param;
@property (readonly, retain) NSData* data;
@property (readonly, retain) PBArray * datas;
@property (readonly, retain) Token* token;
@property (readonly, retain) NSData* device;
- (NSData*)datasAtIndex:(NSUInteger)index;

+ (SessionRequest*) defaultInstance;
- (SessionRequest*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (SessionRequest_Builder*) builder;
+ (SessionRequest_Builder*) builder;
+ (SessionRequest_Builder*) builderWithPrototype:(SessionRequest*) prototype;
- (SessionRequest_Builder*) toBuilder;

+ (SessionRequest*) parseFromData:(NSData*) data;
+ (SessionRequest*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (SessionRequest*) parseFromInputStream:(NSInputStream*) input;
+ (SessionRequest*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (SessionRequest*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (SessionRequest*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface SessionRequest_Builder : PBGeneratedMessage_Builder {
@private
    SessionRequest* result;
}

- (SessionRequest*) defaultInstance;

- (SessionRequest_Builder*) clear;
- (SessionRequest_Builder*) clone;

- (SessionRequest*) build;
- (SessionRequest*) buildPartial;

- (SessionRequest_Builder*) mergeFrom:(SessionRequest*) other;
- (SessionRequest_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (SessionRequest_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasSequence;
- (NSString*) sequence;
- (SessionRequest_Builder*) setSequence:(NSString*) value;
- (SessionRequest_Builder*) clearSequence;

- (BOOL) hasType;
- (NSString*) type;
- (SessionRequest_Builder*) setType:(NSString*) value;
- (SessionRequest_Builder*) clearType;

- (BOOL) hasParam;
- (NSData*) param;
- (SessionRequest_Builder*) setParam:(NSData*) value;
- (SessionRequest_Builder*) clearParam;

- (BOOL) hasData;
- (NSData*) data;
- (SessionRequest_Builder*) setData:(NSData*) value;
- (SessionRequest_Builder*) clearData;

- (PBAppendableArray *)datas;
- (NSData*)datasAtIndex:(NSUInteger)index;
- (SessionRequest_Builder *)addDatas:(NSData*)value;
- (SessionRequest_Builder *)setDatasArray:(NSArray *)array;
- (SessionRequest_Builder *)setDatasValues:(const NSData* *)values count:(NSUInteger)count;
- (SessionRequest_Builder *)clearDatas;

- (BOOL) hasToken;
- (Token*) token;
- (SessionRequest_Builder*) setToken:(Token*) value;
- (SessionRequest_Builder*) setTokenBuilder:(Token_Builder*) builderForValue;
- (SessionRequest_Builder*) mergeToken:(Token*) value;
- (SessionRequest_Builder*) clearToken;

- (BOOL) hasDevice;
- (NSData*) device;
- (SessionRequest_Builder*) setDevice:(NSData*) value;
- (SessionRequest_Builder*) clearDevice;
@end

@interface Token : PBGeneratedMessage {
@private
    BOOL hasVersion_:1;
    BOOL hasTokenTime_:1;
    BOOL hasAppKey_:1;
    BOOL hasToken_:1;
    int32_t version;
    NSString* tokenTime;
    NSString* appKey;
    NSString* token;
}
- (BOOL) hasTokenTime;
- (BOOL) hasAppKey;
- (BOOL) hasToken;
- (BOOL) hasVersion;
@property (readonly, retain) NSString* tokenTime;
@property (readonly, retain) NSString* appKey;
@property (readonly, retain) NSString* token;
@property (readonly) int32_t version;

+ (Token*) defaultInstance;
- (Token*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Token_Builder*) builder;
+ (Token_Builder*) builder;
+ (Token_Builder*) builderWithPrototype:(Token*) prototype;
- (Token_Builder*) toBuilder;

+ (Token*) parseFromData:(NSData*) data;
+ (Token*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Token*) parseFromInputStream:(NSInputStream*) input;
+ (Token*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Token*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Token*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Token_Builder : PBGeneratedMessage_Builder {
@private
    Token* result;
}

- (Token*) defaultInstance;

- (Token_Builder*) clear;
- (Token_Builder*) clone;

- (Token*) build;
- (Token*) buildPartial;

- (Token_Builder*) mergeFrom:(Token*) other;
- (Token_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Token_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasTokenTime;
- (NSString*) tokenTime;
- (Token_Builder*) setTokenTime:(NSString*) value;
- (Token_Builder*) clearTokenTime;

- (BOOL) hasAppKey;
- (NSString*) appKey;
- (Token_Builder*) setAppKey:(NSString*) value;
- (Token_Builder*) clearAppKey;

- (BOOL) hasToken;
- (NSString*) token;
- (Token_Builder*) setToken:(NSString*) value;
- (Token_Builder*) clearToken;

- (BOOL) hasVersion;
- (int32_t) version;
- (Token_Builder*) setVersion:(int32_t) value;
- (Token_Builder*) clearVersion;
@end

@interface SessionResponse : PBGeneratedMessage {
@private
    BOOL hasSequence_:1;
    BOOL hasType_:1;
    BOOL hasCode_:1;
    BOOL hasResultMessage_:1;
    BOOL hasValue_:1;
    BOOL hasData_:1;
    NSString* sequence;
    NSString* type;
    NSString* code;
    NSString* resultMessage;
    NSString* value;
    NSData* data;
    PBAppendableArray * datasArray;
}
- (BOOL) hasSequence;
- (BOOL) hasType;
- (BOOL) hasCode;
- (BOOL) hasResultMessage;
- (BOOL) hasData;
- (BOOL) hasValue;
@property (readonly, retain) NSString* sequence;
@property (readonly, retain) NSString* type;
@property (readonly, retain) NSString* code;
@property (readonly, retain) NSString* resultMessage;
@property (readonly, retain) NSData* data;
@property (readonly, retain) PBArray * datas;
@property (readonly, retain) NSString* value;
- (NSData*)datasAtIndex:(NSUInteger)index;

+ (SessionResponse*) defaultInstance;
- (SessionResponse*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (SessionResponse_Builder*) builder;
+ (SessionResponse_Builder*) builder;
+ (SessionResponse_Builder*) builderWithPrototype:(SessionResponse*) prototype;
- (SessionResponse_Builder*) toBuilder;

+ (SessionResponse*) parseFromData:(NSData*) data;
+ (SessionResponse*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (SessionResponse*) parseFromInputStream:(NSInputStream*) input;
+ (SessionResponse*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (SessionResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (SessionResponse*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface SessionResponse_Builder : PBGeneratedMessage_Builder {
@private
    SessionResponse* result;
}

- (SessionResponse*) defaultInstance;

- (SessionResponse_Builder*) clear;
- (SessionResponse_Builder*) clone;

- (SessionResponse*) build;
- (SessionResponse*) buildPartial;

- (SessionResponse_Builder*) mergeFrom:(SessionResponse*) other;
- (SessionResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (SessionResponse_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasSequence;
- (NSString*) sequence;
- (SessionResponse_Builder*) setSequence:(NSString*) value;
- (SessionResponse_Builder*) clearSequence;

- (BOOL) hasType;
- (NSString*) type;
- (SessionResponse_Builder*) setType:(NSString*) value;
- (SessionResponse_Builder*) clearType;

- (BOOL) hasCode;
- (NSString*) code;
- (SessionResponse_Builder*) setCode:(NSString*) value;
- (SessionResponse_Builder*) clearCode;

- (BOOL) hasResultMessage;
- (NSString*) resultMessage;
- (SessionResponse_Builder*) setResultMessage:(NSString*) value;
- (SessionResponse_Builder*) clearResultMessage;

- (BOOL) hasData;
- (NSData*) data;
- (SessionResponse_Builder*) setData:(NSData*) value;
- (SessionResponse_Builder*) clearData;

- (PBAppendableArray *)datas;
- (NSData*)datasAtIndex:(NSUInteger)index;
- (SessionResponse_Builder *)addDatas:(NSData*)value;
- (SessionResponse_Builder *)setDatasArray:(NSArray *)array;
- (SessionResponse_Builder *)setDatasValues:(const NSData* *)values count:(NSUInteger)count;
- (SessionResponse_Builder *)clearDatas;

- (BOOL) hasValue;
- (NSString*) value;
- (SessionResponse_Builder*) setValue:(NSString*) value;
- (SessionResponse_Builder*) clearValue;
@end

