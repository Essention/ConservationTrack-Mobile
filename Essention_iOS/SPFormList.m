//
//  SPFormList.m
//  Essention_iOS
//
//  Created by Oleksii on 11/27/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "SPFormList.h"

@implementation SPFormList

//@synthesize title,itemID;
-(id)init{

    _mapDictionary=[NSMutableDictionary
     dictionaryWithDictionary:@{
                                @"my:PropertyName":@"",
                                @"my:MonitoringDate":@"",
                                @"my:Status":@"",
                                @"my:TypeofInterest":@"",
                                @"my:TNCInterestAcres":@"",
                                @"my:LastMonitoringDate_PrevYear":@""
                                }];;


    return self;
}

@end
