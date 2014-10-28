//
//  start.m
//  Essention_iOS
//
//  Created by Oleksii on 10/15/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "start.h"


@implementation EsStart

-(void) checkFolder{
    NSArray *folders=[[NSArray alloc] initWithObjects:@"Images",@"GPS",@"Audio", nil];
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    
    NSString *dataPath = [[NSString alloc] init];
    
    for (id object in folders) {
        dataPath = [[documentsDirectory stringByAppendingPathComponent:@"/"] stringByAppendingPathComponent:object];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath
                                  withIntermediateDirectories:NO
                                                   attributes:nil error:&error];
    
        // do something with object
    }
    
}



@end
