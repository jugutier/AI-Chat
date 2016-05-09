//
//  XYZInvoiceView.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "XYZInvoiceView.h"

@implementation XYZInvoiceView

+ (UINib *)nib
{
    return [UINib nibWithNibName:[self cellReuseIdentifier] bundle:[NSBundle bundleForClass:[self class]]];
}

+ (NSString *)cellReuseIdentifier
{
    
    return NSStringFromClass([self class]);
}

- (void)populateFromViewModel:(id<XYZInvoiceViewModel>)viewModel
{
    _accountNumber.text = [viewModel accountNumber];
    _productPrice.text = [viewModel productPrice];
    _taxesSurchargesAndFees.text = [viewModel taxesSurchargesAndFees];
    _total.text = [viewModel total];
    _dueDate.text = [viewModel dueDate];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.containerView.bgColor = [UIColor whiteColor];
}

+ (QMChatCellLayoutModel)layoutModel
{
    QMChatCellLayoutModel defaultLayoutModel = [super layoutModel];
    defaultLayoutModel.avatarSize = CGSizeMake(0, 0);
    defaultLayoutModel.containerInsets = UIEdgeInsetsMake(4, 4, 4, 15),
    defaultLayoutModel.topLabelHeight = 0;
    defaultLayoutModel.bottomLabelHeight = 14;
    
    return defaultLayoutModel;
}

@end
