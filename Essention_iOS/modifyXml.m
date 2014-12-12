//
//  modifyXml.m
//  Essention_iOS
//
//  Created by Oleksii on 12/4/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "modifyXml.h"

@implementation modifyXml

-(id)init{
   
    return self;
}

-(void) setArrayList:(SPFormList *)data xml:(NSString *)xmlString{
    theList=data;
    theXML=xmlString;
    _mapDictionary=theList.mapDictionary;
}

-(NSString *) modXml:(NSMutableDictionary *)fields{
    
    NSString *XMLString = theXML;
    NSError *error = nil;
   // GDataXMLElement *newElement_ = [[GDataXMLElement alloc] initWithXMLString: XMLString error: &error];
   // NSLog(@"New element: %@ error: %@", newElement_, error);
    
    GDataXMLElement *newElement = [[GDataXMLElement alloc] initWithXMLString: XMLString error: &error];
    NSLog(@"New element: %@ error: %@", newElement, error);
    if(nil == error)
    {
        for (NSString* key in _mapDictionary) {
            NSString *val = [_mapDictionary objectForKey:key];
            GDataXMLElement *childElement = [[newElement elementsForName: key ] objectAtIndex: 0];
            // [[childElement attributeForName: @"value"] setStringValue: @"500"];
            [childElement setStringValue:val];
        }
        
    }
    NSLog(@"New element now: %@", newElement);
    
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithRootElement:newElement];
    NSData *xmlData = document.XMLData;
    NSString *stringXml=[[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding] substringFromIndex:21];
  //  [stringXml stringByReplacingOccurrencesOfString: @"<?xml version=\"1.0\"?>" withString:@""];
    
  //  [stringXml replaceCharactersInRange:[ stringXml rangeOfString: @"----"] withString:stringXml];
    
    NSString *rezult=[NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><?mso-infoPathSolution name=\"urn:schemas-microsoft-com:office:infopath:MonitoringReport:-myXSD-2010-08-17T21-53-48\" solutionVersion=\"1.0.0.853\" productVersion=\"14.0.0.0\" PIVersion=\"1.0.0.0\" href=\"https://www.conservationtrack.org/co/home/Forms/MonitoringReport.xsn\"?><?mso-application progid=\"InfoPath.Document\" versionProgid=\"InfoPath.Document.3\"?>%@",stringXml];
   
    return rezult;
    
}

@end
