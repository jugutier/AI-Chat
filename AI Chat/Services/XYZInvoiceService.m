//
//  XYZInvoiceService.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "XYZInvoiceService.h"
@implementation XYZInvoiceService

-(XYZInvoiceVM *)invoiceForCustomer:(NSString *)customerID
{    
    XYZInvoiceVM * currentInvoice = [[XYZInvoiceVM alloc]init];
    currentInvoice.accountNumber = @"1232123-12321231-2213213";
    currentInvoice.productPrice = @"60.0";
    currentInvoice.taxesSurchargesAndFees = @"8.00";
    currentInvoice.total = @"$123.00";
    currentInvoice.dueDate = @"5/8/16";
    return currentInvoice;
}
@end
