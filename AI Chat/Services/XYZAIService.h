//
//  XYZAIService.h
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * AI Service Signleton.
 * This class is in charge of processing user input aided by the server
 * and response appropiately with the most suitable information at hand.
 */
@interface XYZAIService : NSObject
/**
 * Access the shared instance singleton.
 */
+(instancetype)sharedInstance;
/**
 * Process user text, using patterns that compile to LALR automata.
 */
-(void)processText:(NSString *)text;
@end
