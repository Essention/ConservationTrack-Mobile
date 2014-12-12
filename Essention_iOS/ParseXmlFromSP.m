//
//  ParseXmlFromSP.m
//  Essention_iOS
//
//  Created by Oleksii on 11/27/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "ParseXmlFromSP.h"

@implementation ParseXmlFromSP


-(id) initParse{

    //_parselistArray=[[NSMutableArray alloc] init];
    return self;
}

-(SPFormList *) getArrayList{
    return theList;  //_parselistArray;
}
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    flagEndParse=false;
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    flagEndParse=true;
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    if ([elementName isEqualToString:@"my:myFields"]) {
        //_parselistArray=[[NSMutableArray alloc] init];
        theList= [[SPFormList alloc] init];
    }
   // else if ([elementName isEqualToString:@"my:PropertyName"]){
    //    theList= [[SPFormList alloc] init];
        //theList.
      //  [self setCurrentProperty:kABLastNameProperty];
        //theList._Name_PropertyName=//[correntElementValue];
        //    [theList._Name_PropertyName set];
        //[attributeDict valueForKey:@"my:PropertyName"];
        //theList.itemID=[[attributeDict valueForKey:@"ows_ID"] intValue];
        // theList.LinkFilename=[attributeDict valueForKey:@"ows_LinkFilename"];
   // }
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    

    if (!correntElementValue) {
        correntElementValue=[[NSMutableString alloc] initWithString:string];
    }
    else{
        [correntElementValue appendString:string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"my:myFields"]) {
        return;
    }

   // [correntElementValue stringByReplacingOccurrencesOfString:@"\n\t" withString:@""];
    if ([elementName isEqualToString:@"my:PropertyName"]) {
        theList._Name_PropertyName=correntElementValue;
    }
    else if([elementName isEqualToString:@"my:MonitoringDate"]) {
        theList._MonitoringDate=correntElementValue;
    }
    else if([elementName isEqualToString:@"my:Status"]) {
        theList._Status=correntElementValue;
    }
    else if([elementName isEqualToString:@"my:TypeofInterest"]) {
        theList._TypeofInterest=correntElementValue;
    }
    else if([elementName isEqualToString:@"my:TNCInterestAcres"]) {
        theList._TNCInterestAcres=correntElementValue;
    }
    else if([elementName isEqualToString:@"my:LastMonitoringDate_PrevYear"]) {
        theList._LastMonitoringDate_PrevYear=correntElementValue;
    }

    
    // else{
   //     [theList setValue:correntElementValue forKey:elementName];
   // }
    
    //theList=nil;
    correntElementValue=nil;
    
}

@end
