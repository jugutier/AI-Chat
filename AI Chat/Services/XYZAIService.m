//
//  XYZAIService.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "XYZAIService.h"
#import "XYZInvoiceService.h"

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

-(void)processText:(NSString *)text forSenderId:(NSString *)senderId
{
    QBChatMessage *message;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@",
                              @"bill"];
    BOOL hasBill = [predicate evaluateWithObject:text];
    if(hasBill)
    {
        message = [[XYZInvoiceService sharedInstance]invoiceForCustomer:senderId];
        message.senderID = QMMessageTypeInvoice;
    }else
    {
        message = [QBChatMessage message];
        message.senderID = 20001;
        message.text = text;
    }
    message.senderNick = @"Joe C. ";
    message.dateSent = [NSDate dateWithTimeInterval:1.0f sinceDate:[NSDate date]];
    [self performSelector:@selector(handleData:) withObject:message afterDelay:1.0];
}
-(void)handleData:(id)data
{
    [self.delegate didFinishProcessingWithData:data];
}
@end
