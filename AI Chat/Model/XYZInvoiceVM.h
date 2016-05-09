//
//  XYZInvoiceViewModel.h
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZInvoiceView.h"
@interface XYZInvoiceVM : NSObject<XYZInvoiceViewModel>

@property(nonatomic,retain) NSString * accountNumber;
@property(nonatomic,retain) NSString * productPrice;
@property(nonatomic,retain) NSString * taxesSurchargesAndFees;
@property(nonatomic,retain) NSString * total;
@property(nonatomic,retain) NSString * dueDate;

@end
