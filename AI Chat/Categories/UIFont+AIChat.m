//
//  UIFont+AIChat.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "UIFont+AIChat.h"

@implementation UIFont (AIChat)
+(UIFont *)nicknameFont
{
    return [UIFont fontWithName:@"Helvetica" size:14];
}
+(UIFont *)titleFont
{
    return [UIFont fontWithName:@"Helvetica" size:18];
}
+(UIFont *)itemFont
{
    return [UIFont fontWithName:@"Helvetica" size:15];
}
+(UIFont *)timeStampFont
{
    return [UIFont fontWithName:@"Helvetica" size:12];
}
@end
