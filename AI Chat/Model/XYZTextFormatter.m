//
//  XYZTextFormatter.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "XYZTextFormatter.h"

@implementation XYZTextFormatter

- (NSAttributedString *)topLabelAttributedStringForParticipant:(BOOL)isLocal andNick:(NSString *)nickname
{
    UIFont *font = [UIFont nicknameFont];
    
    NSDictionary *attributes = @{ NSForegroundColorAttributeName:[UIColor remoteNicknameColor], NSFontAttributeName:font};
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:nickname attributes:attributes];
    
    return attrStr;
}

- (NSAttributedString *)bottomLabelAttributedStringForParticipant:(BOOL)isLocal andDate:(NSDate *)date
{
    
    UIColor *textColor = isLocal? [UIColor localTimestampColor] : [UIColor remoteTimestampColor];
    UIFont *font = [UIFont timeStampFont];
    
    NSDictionary *attributes = @{ NSForegroundColorAttributeName:textColor, NSFontAttributeName:font};
    NSMutableAttributedString *attrStr =
    [[NSMutableAttributedString alloc] initWithString:[self timeStampWithDate:date]
                                           attributes:attributes];
    
    return attrStr;
}

-(NSAttributedString *)itemLabelAttributedStringForParticipant:(BOOL)isLocal andText:(NSString *)text
{
    
    UIColor *textColor = isLocal ? [UIColor localChatColor] : [UIColor remoteChatColor];
    UIFont *font = [UIFont itemFont];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName : textColor,
                                 NSFontAttributeName : font};
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    
    return attrStr;
}

- (NSString *)timeStampWithDate:(NSDate *)date
{
    
    static NSDateFormatter *dateFormatter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"HH:mm";
    });
    
    NSString *timeStamp = [dateFormatter stringFromDate:date];
    
    return timeStamp;
}
@end
