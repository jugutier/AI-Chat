//
//  XYZInvoiceService.h
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZInvoiceVM.h"

@interface XYZInvoiceService : NSObject
/**
 * Access the shared instance singleton.
 */
+(instancetype)sharedInstance;
/**
 * Gets the current invoice for a given customerID;
 */
-(XYZInvoiceVM *)invoiceForCustomer:(NSString *)customerID;
@end
