//
//  UIColor+AIChat.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "UIColor+AIChat.h"

@implementation UIColor (AIChat)
+(UIColor *)titleColor
{
    return [UIColor grayColor];
}
+(UIColor *)localChatColor
{
    return [UIColor whiteColor];
}
+(UIColor *)localTimestampColor
{
    return [UIColor colorWithWhite:1.000 alpha:0.510];
}
+(UIColor *)remoteNicknameColor
{
    return [UIColor colorWithRed:0.184 green:0.467 blue:0.733 alpha:1.000];
}
+(UIColor *)remoteChatColor
{
    return [UIColor colorWithWhite:0.290 alpha:1.000];
}
+(UIColor *)remoteTimestampColor
{
    return [UIColor colorWithWhite:0.000 alpha:0.490];
}
@end
