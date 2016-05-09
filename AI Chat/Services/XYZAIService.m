//
//  XYZAIService.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "XYZAIService.h"
//#import "QBChatMessage.h"

@implementation XYZAIService

+(instancetype)sharedInstance
{
    static XYZAIService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)processText:(NSString *)text
{
    QBChatMessage *message3 = [QBChatMessage message];
    message3.senderID = 20001;
    message3.senderNick = @"Joe C. ";
    message3.text = text;
    message3.dateSent = [NSDate dateWithTimeInterval:-6.0f sinceDate:[NSDate date]];
}

@end
