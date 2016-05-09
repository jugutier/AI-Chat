//
//  XYZInvoiceView.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "XYZInvoiceView.h"

@implementation XYZInvoiceView

- (instancetype)init
{
    NSString *nibName = NSStringFromClass([self class]);
    self = [[[UINib nibWithNibName:nibName bundle:nil] instantiateWithOwner:nil
                                                                    options:nil] firstObject];
    return self;
}

- (void)populateFromViewModel:(id<XYZInvoiceViewModel>)viewModel
{
    _accountNumber.text = [viewModel accountNumber];
    _productPrice.text = [viewModel productPrice];
    _taxesSurchargesAndFees.text = [viewModel taxesSurchargesAndFees];
    _total.text = [viewModel total];
    _dueDate.text = [viewModel dueDate];
}
//
//- (void)awakeFromNib {
//    
//    [super awakeFromNib];
//    self.containerView.bgColor = [UIColor whiteColor];
//}
//
//+ (QMChatCellLayoutModel)layoutModel {
//    
//    QMChatCellLayoutModel defaultLayoutModel = [super layoutModel];
//    defaultLayoutModel.containerInsets = UIEdgeInsetsMake(4, 15, 4, 4);
//    
//    return defaultLayoutModel;
//}
@end
