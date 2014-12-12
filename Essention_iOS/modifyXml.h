//
//  modifyXml.h
//  Essention_iOS
//
//  Created by Oleksii on 12/4/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPFormList.h"
#import "GDataXMLNode.h"

@interface modifyXml : NSObject{
    
    
    //SP *app;
    SPFormList *theList;
    NSString *theXML;
    NSMutableString *correntElementValue;
    BOOL flagEndParse;
}
//@property(strong,nonatomic)      NSMutableArray *parselistArray;
//@property(strong,nonatomic)      NSMutableArray *parselistArray;
@property(nonatomic,readwrite) NSMutableDictionary *mapDictionary;


-(void) setArrayList:(SPFormList *)data xml:(NSString *)xmlString;
-(NSString *) modXml:(NSMutableDictionary *)fields;



@end
