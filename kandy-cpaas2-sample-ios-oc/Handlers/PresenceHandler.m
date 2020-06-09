
#import "PresenceHandler.h"

@implementation PresenceHandler

+ (instancetype)sharedInstance
{
    static PresenceHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PresenceHandler alloc] init];
    });
    return sharedInstance;
}

- (CPAuthenticationService *)authentication{
    return _cpaas.authenticationService;
}

-(void)setUp{
    contact = [[NSArray alloc]initWithObjects:@"nesonukuv@nesonukuv.34mv.att.com", nil];
}
-(void)subscribeServices{
    [self setUp];
    self.cpaas.presenceService.delegate = self;
}
- (void)listChangedWithPresentityList:(CPPresentityList * _Nonnull)presentityList {
    presentityLst = presentityList;
    NSLog(@"%@", presentityList);
}

- (void)statusChangedWithPresentity:(CPPresentity * _Nonnull)presentity {
    NSLog(@"%@", presentity);
}

- (void)subscriptionExpiredWithPresentityListHandle:(CPPresentityListHandle * _Nonnull)presentityListHandle {
    NSLog(@"%@", presentityListHandle);
}
-(CPPresenceActivities)convertStringToEnum:(NSString*)str
{
     //let activityTypesArray = ["Available","Unknown", "Other", "Away", "Busy", "Lunch", "OnThePhone", "Vacation"]
    if ([str isEqualToString:@"Available"])
        return CPPresenceActivitiesAvailable;
    else if ([str isEqualToString:@"Unknown"])
        return CPPresenceActivitiesActivitiesUnknown;
    else if ([str isEqualToString:@"Other"])
        return CPPresenceActivitiesActivitiesOther;
    else if ([str isEqualToString:@"Away"])
        return CPPresenceActivitiesAway;
    else if ([str isEqualToString:@"Busy"])
        return CPPresenceActivitiesBusy;
    else if ([str isEqualToString:@"Lunch"])
        return CPPresenceActivitiesLunch;
    else if ([str isEqualToString:@"OnThePhone"])
        return CPPresenceActivitiesOnThePhone;
    else if ([str isEqualToString:@"Vacation"])
        return CPPresenceActivitiesVacation;
    else
        return CPPresenceActivitiesAvailable;
}
-(void)updateStatus:(NSString*)statusToUpdate{
    //NSString *abc = CPPresenceActivities
    
    PresenceActivity *presenceActivity = [[PresenceActivity alloc]init:[self convertStringToEnum:statusToUpdate]];
    [self.cpaas.presenceService createPresenceSourceWithActivity:presenceActivity completion:^(CPError * _Nullable error, CPPresenceSource * _Nullable newPresenceSource) {
        NSString *status = newPresenceSource.activity.string;
        if ([self.delegate conformsToProtocol:@protocol(PresenceDelegate)] && [self.delegate respondsToSelector:@selector(updateUserStatus:)]){
            [self.delegate updateUserStatus:status];
        }
    }];
}

-(void)checkPresence{
    [self.cpaas.presenceService createPresentityListWithName:@"default" presentities:contact completion:^(CPError * _Nullable error, CPPresentityList * _Nullable newPresentityList) {
        if (error == nil) {
            self->presentityLst = newPresentityList;
            [self->presentityLst subscribeWithCompletion:^(CPError * _Nullable error) {
                if (error) {
                    NSLog(@"Failed to subscribe to presentity list");
                }
            }];
        }
        else{
            NSLog(@"Failed to subscribe to presentity list");
        }
    }];
}

//Fetch All Presentity
-(void)fetchAllPrentities{
    [self.cpaas.presenceService fetchAllPresentityListsWithCompletion:^(CPError * _Nullable error, NSArray<CPPresentityList *> * _Nullable presentityLists) {
        self->presentityLst = [presentityLists firstObject];
        if (error == nil) {
            self->presentityLst = [presentityLists firstObject];
            [self->presentityLst subscribeWithCompletion:^(CPError * _Nullable error) {
                if (error) {
                    NSLog(@"%@", error.localizedDescription);

                }
            }];
        }
        
        [self->presentityLst fetchStatusWithCompletion:^(CPError * _Nullable error, CPPresentityList * _Nullable presentityStatusList) {
            if ([self.delegate conformsToProtocol:@protocol(PresenceDelegate)] && [self.delegate respondsToSelector:@selector(listOfPresenties:)]) {
                [self.delegate listOfPresenties:presentityStatusList];
            }
            else{
                NSLog(@"%@", error.localizedDescription);
            }
        }];
    }];
}


@end
