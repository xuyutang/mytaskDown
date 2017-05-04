

#import "UpdateVersion.h"
#import "Product.h"

/// NSUserDefault macros to store user's preferences for AlertTypeSkip
#define kDefaultShouldSkipVersion      @"Should Skip Version Boolean"
#define kDefaultSkippedVersion         @"User Decided To Skip Version Update Boolean"

/// i18n/l10n macros
#define kCurrentVersion [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define kBundle [[NSBundle mainBundle] pathForResource:@"UpdateVersion" ofType:@"bundle"]
#define LocalizedString(stringKey) \
    [[NSBundle bundleWithPath:kBundle] localizedStringForKey:stringKey value:stringKey table:@"Localizable"]

/// App Store Link
#define kAppStoreLinkUniversal              @"http://itunes.apple.com/lookup?id=%@"
#define kAppStoreLinkCountrySpecific        @"http://itunes.apple.com/lookup?id=%@&country=%@"

@interface UpdateVersion() <UIAlertViewDelegate>

@property (strong, nonatomic) NSDate *lastVersionCheckPerformedOnDate;

- (NSUInteger)numberOfDaysElapsedBetweenILastVersionCheckDate;
- (void)showAlertIfCurrentAppStoreVersionNotSkipped:(NSString *)currentAppStoreVersion;
- (void)showAlertWithAppStoreVersion:(NSString *)currentAppStoreVersion;
- (void)launchAppStore;

@end

@implementation UpdateVersion

#pragma mark - Initialization Methods
+ (id)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _alertType = AlertTypeOption;
    }
    return self;
}

#pragma mark - Public Methods
- (void)checkVersion:(BOOL)bAtOnce
{
    // Asynchronously query iTunes AppStore for publically available version
    
    /*NSString *storeString = nil;
    if ( [self countryCode] ) {
        storeString = [NSString stringWithFormat:kAppStoreLinkCountrySpecific, self.appID, self.countryCode];
    } else {
        storeString = [NSString stringWithFormat:kAppStoreLinkUniversal, self.appID];
    }*/
    
    NSURL *storeURL = [NSURL URLWithString:APP_PLIST_URL];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:storeURL];
    request.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    [request setHTTPMethod:@"GET"];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ( [data length] > 0 && !error ) { // Success
            
            //NSDictionary *appData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSString *error;
            NSPropertyListFormat format;
            NSDictionary* appData = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSDictionary* itemdata = [appData objectForKey:@"items"];
                // Store version comparison date
                self.lastVersionCheckPerformedOnDate = [NSDate date];
                
                // All versions that have been uploaded to the AppStore
                NSArray *versionsInAppStore = [[itemdata valueForKey:@"metadata"] valueForKey:@"bundle-version"];
                
                if ( ![versionsInAppStore count] ) { // No versions of app in AppStore
                    
                    if (bAtOnce){
                        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"应用更新"
                                                                   message:@"目前已是最新版本，无需升级。"
                                                                  delegate:self
                                                         cancelButtonTitle:@"确定"
                                                         otherButtonTitles:nil];
                        [alert show];
                    }
                    return;
                    
                } else {
                    if ([[[itemdata valueForKey:@"metadata"] valueForKey:@"changelog"] objectAtIndex:0] != [NSNull null]){
                        _changelog = [[[itemdata valueForKey:@"metadata"] valueForKey:@"changelog"] objectAtIndex:0];
                        _changelog = [_changelog stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
                        //[_changelog initWithData:[[[itemdata valueForKey:@"metadata"] valueForKey:@"changelog"] objectAtIndex:0] encoding:NSUTF8StringEncoding];
                    }
                    else
                        _changelog = [NSString stringWithFormat:@"%@已更新。请更新至新版本。", [[NSBundle mainBundle]objectForInfoDictionaryKey:@"CFBundleDisplayName"]];

                    NSLog(@"changelog:%@",_changelog);
                    NSString *currentAppStoreVersion = [versionsInAppStore objectAtIndex:0];
                    NSLog(@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]);
                    if ( [kCurrentVersion compare:currentAppStoreVersion options:NSNumericSearch] != NSOrderedSame ) {
                        
                        [self showAlertIfCurrentAppStoreVersionNotSkipped:currentAppStoreVersion];
                        
                    } else {
                        if (bAtOnce){
                            // Current installed version is the newest public version or newer (e.g., dev version)
                            UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"应用更新"
                                                                       message:@"目前已是最新版本，无需升级。"
                                                                      delegate:self
                                                             cancelButtonTitle:@"确定" 
                                                             otherButtonTitles:nil];
                            [alert show];
                        }
                    }
                    
                }
                
            });
        }
        
    }];
}

- (void)checkVersionDaily
{
    /*
     On app's first launch, lastVersionCheckPerformedOnDate isn't set.
     Avoid false-positive fulfilment of second condition in this method.
     Also, performs version check on first launch.
     */
    if ( !self.lastVersionCheckPerformedOnDate ) {
        
        // Set Initial Date
        self.lastVersionCheckPerformedOnDate = [NSDate date];
        
        // Perform First Launch Check
        [self checkVersion:TRUE];
        
    }
    
    // If daily condition is satisfied, perform version check
    if ( [self numberOfDaysElapsedBetweenILastVersionCheckDate] > 1 ) {
        
        [self checkVersion:TRUE];
        
    }
}

- (void)checkVersionWeekly
{
    /*
     On app's first launch, lastVersionCheckPerformedOnDate isn't set.
     Avoid false-positive fulfilment of second condition in this method.
     Also, performs version check on first launch.
     */
    if ( !self.lastVersionCheckPerformedOnDate ) {
        
        // Set Initial Date
        self.lastVersionCheckPerformedOnDate = [NSDate date];
        
        // Perform First Launch Check
        [self checkVersion:TRUE];
        
    }
    
    // If weekly condition is satisfied, perform version check 
    if ( [self numberOfDaysElapsedBetweenILastVersionCheckDate] > 7 ) {
        
        [self checkVersion:TRUE];

    }
}

#pragma mark - Private Methods
- (NSUInteger)numberOfDaysElapsedBetweenILastVersionCheckDate
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [currentCalendar components:kCFCalendarUnitDay
                                                      fromDate:self.lastVersionCheckPerformedOnDate
                                                        toDate:[NSDate date]
                                                       options:0];
    
    return [components day];
}

- (void)showAlertIfCurrentAppStoreVersionNotSkipped:(NSString *)currentAppStoreVersion
{
    // Check if user decided to skip this version in the past
    BOOL shouldSkipVersionUpdate = [[NSUserDefaults standardUserDefaults] boolForKey:kDefaultShouldSkipVersion];
    NSString *storedSkippedVersion = [[NSUserDefaults standardUserDefaults] objectForKey:kDefaultSkippedVersion];
    
    if ( !shouldSkipVersionUpdate ) {
        
        [self showAlertWithAppStoreVersion:currentAppStoreVersion];
        
    } else if ( shouldSkipVersionUpdate && ![storedSkippedVersion isEqualToString:currentAppStoreVersion] ) {
        
        [self showAlertWithAppStoreVersion:currentAppStoreVersion];
        
    } else {
        
        // Don't show alert.
        return;
    }
}

- (void)showAlertWithAppStoreVersion:(NSString *)currentAppStoreVersion
{
    // Reference App's name
    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
    
    switch ( self.alertType ) {
            
        case AlertTypeForce: {
            
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"已有可用的更新 %@",
                                                                         currentAppStoreVersion]
                                                                message:_changelog
                                                               delegate:self
                                                      cancelButtonTitle:@"更新"
                                                      otherButtonTitles:nil, nil];
            
            [alertView show];

            
        } break;
            
        case AlertTypeOption: {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"已有可用的更新 %@",
                                                                         currentAppStoreVersion]
                                                                message:_changelog
                                                               delegate:self
                                                      cancelButtonTitle:@"暂不更新"
                                                      otherButtonTitles:@"更新", nil];
            
            [alertView show];
            
        } break;
            
        case AlertTypeSkip: {
            
            // Store currentAppStoreVersion in case user pushes skip
            [[NSUserDefaults standardUserDefaults] setObject:currentAppStoreVersion forKey:kDefaultSkippedVersion];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"已有可用的更新 %@",
                                                                         currentAppStoreVersion]
                                                                message:_changelog
                                                               delegate:self
                                                      cancelButtonTitle:@"忽略这个版本"
                                                      otherButtonTitles:@"更新", @"下一次", nil];
            
            [alertView show];
            
        } break;
            
        default:
            break;
    }

    if([self.delegate respondsToSelector:@selector(DidShowUpdateDialog)]){
        [self.delegate DidShowUpdateDialog];
    }
}

- (void)launchAppStore
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    //NSString *iTunesString = [NSString stringWithFormat:@"https://itunes.apple.com/app/id%@", self.appID];
    //NSLog(@"Current OS Version:%d",[[[[UIDevice currentDevice] systemVersion] stringByReplacingOccurrencesOfString:@"." withString:@""] intValue]);
    //NSLog(@"Current OS Version:%f",[[[UIDevice currentDevice] systemVersion] floatValue]);
    NSURL *iTunesURL = [NSURL URLWithString:APP_URL];
    NSLog(@"%@",APP_URL);
    [[UIApplication sharedApplication] openURL:iTunesURL];

    if([self.delegate respondsToSelector:@selector(UserDidLaunchAppStore)]){
        [self.delegate UserDidLaunchAppStore];
    }
}

#pragma mark - UIAlertViewDelegate Methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch ( self.alertType ) {
            
        case AlertTypeForce: { // Launch App Store.app

            [self launchAppStore];

        } break;
            
        case AlertTypeOption: {
            
            if ( 1 == buttonIndex ) { // Launch App Store.app
                
                [self launchAppStore];
                
            } else { // Ask user on next launch
                
                if([self.delegate respondsToSelector:@selector(UserDidCancel)]){
                    [self.delegate UserDidCancel];
                }
                
            }
            
        } break;
            
        case AlertTypeSkip: {
            
            if ( 0 == buttonIndex ) { // Skip current version in AppStore
            
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kDefaultShouldSkipVersion];
                [[NSUserDefaults standardUserDefaults] synchronize];

                if([self.delegate respondsToSelector:@selector(UserDidSkipVersion)]){
                    [self.delegate UserDidSkipVersion];
                }
                
            } else if ( 1 == buttonIndex ) { // Launch App Store.app
                
                [self launchAppStore];
                
            } else if ( 2 == buttonIndex) { // Ask user on next launch

                if([self.delegate respondsToSelector:@selector(UserDidCancel)]){
                    [self.delegate UserDidCancel];
                }
                
            }
            
        } break;
            
        default:
            break;
    }
}

/*
- (void)willPresentAlertView:(UIAlertView *)alertView{

        int intFlg = 0 ;//先是title intFlg = 0，当intFlg =1;message label
        for( UIView * view in alertView.subviews ){
            if( [view isKindOfClass:[UILabel class]] ){
                UILabel* label = (UILabel*) view;
                //if(intFlg == 1){
                    label.textAlignment = UITextAlignmentLeft;
                //}
                intFlg = 1;
            }
            
        }
    
}
*/
@end
