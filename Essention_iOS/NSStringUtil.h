//
//  NSStringUtil.h
//  Essention_iOS
//
//  Created by Oleksii on 12/8/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSString.h>

@interface NSString (NSStringUtil)

+ (NSString *) base64StringFromData:(NSData *)data length:(int)length;

@end