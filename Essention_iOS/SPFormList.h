//
//  SPFormList.h
//  Essention_iOS
//
//  Created by Oleksii on 11/27/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPFormList : NSObject
//{
  //  NSString *_Name_PropertyName;
//}

//@property (nonatomic,retain)        NSString *title;
//@property(nonatomic,readwrite)      NSInteger *itemID;
//@property(nonatomic,readwrite)      NSString *LinkFilename;
@property(nonatomic,readwrite) NSMutableDictionary *mapDictionary;
///////
@property(nonatomic,readwrite)      NSString *_Name_PropertyName;
@property(nonatomic,readwrite)      NSString *_MonitoringDate;
@property(nonatomic,readwrite)      NSString *_Status;
@property(nonatomic,readwrite)      NSString *_TypeofInterest;
@property(nonatomic,readwrite)      NSString *_TNCInterestAcres;
@property(nonatomic,readwrite)      NSString *_LastMonitoringDate_PrevYear;

@end
