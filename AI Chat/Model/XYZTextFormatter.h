//
//  XYZTextFormatter.h
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZTextFormatter : NSObject
/**
 * Retrieve the attributed string for the timestamp (local or remote participant)
 */
- (NSAttributedString *)bottomLabelAttributedStringForParticipant:(BOOL)isLocal andDate:(NSDate *)date;

/**
 * Retrieve the attributed string for the nickname (usually remote participant)
 */
- (NSAttributedString *)topLabelAttributedStringForParticipant:(BOOL)isLocal andNick:(NSString *)nickname;

/**
 * Retrieve the attributed string for the message body (local or remote participant)
 */
-(NSAttributedString *)itemLabelAttributedStringForParticipant:(BOOL)isLocal andText:(NSString *)text;
@end
