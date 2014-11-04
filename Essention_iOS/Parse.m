//
//  Parse.m
//  Essention_iOS
//
//  Created by Oleksii on 10/30/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "Parse.h"

@implementation Parse
//@synthesize parselistArray;

-(id) initParse{
    //if (self==[super init]) {
    //    app=(SP *)[[UIApplication sharedApplication] delegate];
    //}
    
    _parselistArray=[[NSMutableArray alloc] init];
   return self;
    
}

-(NSMutableArray *) getArrayList{

    return _parselistArray;
    
}
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    flagEndParse=false;
}
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    flagEndParse=true;
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqualToString:@"rs:data"]) {
        _parselistArray=[[NSMutableArray alloc] init];
    }
    else if ([elementName isEqualToString:@"z:row"]){
        theList= [[List alloc] init];
        theList.title=[attributeDict valueForKey:@"ows_Title"];
        theList.itemID=[[attributeDict valueForKey:@"ows_ID"] intValue];
        theList.LinkFilename=[attributeDict valueForKey:@"ows_LinkFilename"];
    }

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
    if ([elementName isEqualToString:@"rs:data"]) {
        return;
    }
    if ([elementName isEqualToString:@"z:row"]) {
        [_parselistArray addObject:theList];
        theList=nil;
    }
    else{
        [theList setValue:correntElementValue forKey:elementName];
    }
    correntElementValue=nil;
    
}

@end
