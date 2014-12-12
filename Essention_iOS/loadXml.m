//
//  loadXml.m
//  Essention_iOS
//
//  Created by Oleksii on 12/4/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "loadXml.h"

@implementation loadXml

- (NSString *)dataFilePath:(BOOL)forSave {
    return [[NSBundle mainBundle] pathForResource:@"co" ofType:@"xml"];
}

- (NSData *)loadParty {
    
    NSString *filePath = [self dataFilePath:FALSE];
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
   // NSError *error;
   //GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    //if (doc == nil)
    //{
    //    return nil;
    //}
    
    //NSLog(@"%@", doc.rootElement);
    
    //[doc release];
    //[xmlData release];
    return xmlData;
    
}

@end
