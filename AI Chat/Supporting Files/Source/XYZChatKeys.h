//
//  XYZChatKeys.h
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//
#ifndef __XYZChatKeys__
#define __XYZChatKeys__
extern NSString* const XYZ_accountKey;
extern int  const XYZ_appID;
extern NSString* const XYZ_authKey;
extern NSString* const XYZ_authSecret;

typedef NS_ENUM(NSUInteger, QMMessageType) {
    
    QMMessageTypeText = 0,
    QMMessageTypeCreateGroupDialog = 1,
    QMMessageTypeUpdateGroupDialog = 2,
    
    QMMessageTypeContactRequest = 4,
    QMMessageTypeAcceptContactRequest,
    QMMessageTypeRejectContactRequest,
    QMMessageTypeDeleteContactRequest,
    QMMessageTypeInvoice
};

#endif
