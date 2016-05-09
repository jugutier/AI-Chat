//
//  XYZInvoiceView.h
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYZInvoiceViewModel <NSObject>
- (NSString *) accountNumber;
- (NSString *) productPrice;
- (NSString *) taxesSurchargesAndFees;
- (NSString *) total;
- (NSString *) dueDate;

@end

@interface XYZInvoiceView : UIView


@property(nonatomic,retain) IBOutlet UILabel * accountNumber;
@property(nonatomic,retain) IBOutlet UILabel * productPrice;
@property(nonatomic,retain) IBOutlet UILabel * taxesSurchargesAndFees;
@property(nonatomic,retain) IBOutlet UILabel * total;
@property(nonatomic,retain) IBOutlet UILabel * dueDate;

- (void)populateFromViewModel:(id<XYZInvoiceViewModel>)viewModel;

@end
