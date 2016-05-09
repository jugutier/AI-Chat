//
//  XYZInvoiceService.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "XYZInvoiceService.h"
@implementation XYZInvoiceService

+(instancetype)sharedInstance
{
    static XYZInvoiceService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(XYZInvoiceVM *)invoiceForCustomer:(NSString *)customerID
{    
    XYZInvoiceVM * currentInvoice = [XYZInvoiceVM message];
    currentInvoice.accountNumber = @"1232123-12321231-2213213";
    currentInvoice.productPrice = @"30.0";
    currentInvoice.taxesSurchargesAndFees = @"2.00";
    currentInvoice.total = @"$123.00";
    currentInvoice.dueDate = @"5/8/16";
    return currentInvoice;
}
@end
