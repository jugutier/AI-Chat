//
//  XYZChatViewController.m
//  AI Chat
//
//  Created by Julian Gutierrez on 5/8/16.
//  Copyright © 2016 Company Inc. All rights reserved.
//

#import "XYZChatViewController.h"
#import "XYZTextFormatter.h"
#import "XYZAIService.h"
NS_ENUM(NSUInteger, QMMessageType) {
    
    QMMessageTypeText = 0,
    QMMessageTypeCreateGroupDialog = 1,
    QMMessageTypeUpdateGroupDialog = 2,
    
    QMMessageTypeContactRequest = 4,
    QMMessageTypeAcceptContactRequest,
    QMMessageTypeRejectContactRequest,
    QMMessageTypeDeleteContactRequest
};

@interface XYZChatViewController () <XYZAIServiceDelegate>

@property(nonatomic,retain) XYZTextFormatter * formatter;

@end

@implementation XYZChatViewController

-(instancetype)init
{
    if (self = [super init]) {
        _formatter = [[XYZTextFormatter alloc]init];
        [XYZAIService sharedInstance].delegate = self;
    }
    return self;
}
- (NSTimeInterval)timeIntervalBetweenSections {
    return 300.0f;
}

- (CGFloat)heightForSectionHeader {
    return 40.0f;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.senderID = 2000;
    self.senderDisplayName = @"hello";
    self.title = @"CHAT WITH US";
    [self.navigationController.navigationBar setTitleTextAttributes:
        @{ NSFontAttributeName: [UIFont titleFont],
           NSForegroundColorAttributeName: [UIColor titleColor]
        }];

//    //
//    //
//    QBChatMessage *message2 = [QBChatMessage message];
//    message2.senderID = self.senderID;
//    message2.text = @"Why Q-municate is a right choice?";
//    message2.dateSent = [NSDate dateWithTimeInterval:-9.0f sinceDate:[NSDate date]];
//    //
//    //
//    QBChatMessage *message3 = [QBChatMessage message];
//    message3.senderID = 20001;
//    message3.senderNick = @"Andrey M. ";
//    //message3.customParameters = [@{@"nick": @"Andrey M."} mutableCopy];
//    message3.text = @"Q-municate comes with powerful instant messaging right out of the box. Powered by the flexible XMPP protocol and Quickblox signalling technologies, with compatibility for server-side chat history, group chats, attachments and user avatars, it's pretty powerful. It also has chat bubbles and user presence (online/offline).";
//    message3.dateSent = [NSDate dateWithTimeInterval:-6.0f sinceDate:[NSDate date]];
//    //
//    //
//    // message with an attachment
//    //
//    QBChatMessage *message4 = [QBChatMessage message];
//    message4.ID = @"4";
//    message4.senderID = 20001;
//    message4.senderNick = @"Andrey M.";
//    QBChatAttachment *attachment = [QBChatAttachment new];
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"quickblox-image" ofType:@"png"];
//    attachment.url = imagePath;
//    message4.attachments = @[attachment];
//    message4.dateSent = [NSDate dateWithTimeInterval:-3.0f sinceDate:[NSDate date]];
//    
//    [self.chatSectionManager addMessages:@[ message2, message3, message4]];
}
#pragma mark - XYZAIServiceDelegate
-(void)didFinishProcessingWithData:(id)data
{    
    [self.chatSectionManager addMessage:(QBChatMessage*)data];
}
#pragma mark Tool bar Actions

- (void)didPressSendButton:(UIButton *)button
           withMessageText:(NSString *)text
                  senderId:(NSUInteger)senderId
         senderDisplayName:(NSString *)senderDisplayName
                      date:(NSDate *)date {
    
    QBChatMessage *message = [QBChatMessage message];
    message.text = text;
    message.senderID = senderId;
    message.dateSent = [NSDate date];
    [[XYZAIService sharedInstance] processText:text];
    [self.chatSectionManager addMessage:message];
    
    [self finishSendingMessageAnimated:YES];
}

- (void)didPickAttachmentImage:(UIImage *)image {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *resizedImage = [[image fixOrientation] resizedImageForChat];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        
        NSData *binaryImageData = UIImagePNGRepresentation(resizedImage);
        NSString *imageName = [NSString stringWithFormat:@"%f-attachment.png", [[NSDate date] timeIntervalSince1970]];
        NSString *imagePath = [basePath stringByAppendingPathComponent:imageName];
        
        [binaryImageData writeToFile:imagePath atomically:YES];
        
        QBChatMessage* message = [QBChatMessage new];
        message.senderID = self.senderID;
        
        QBChatAttachment *attacment = [[QBChatAttachment alloc] init];
        attacment.url = imagePath;
        
        message.attachments = @[attacment];
        
        [self.chatSectionManager addMessage:message];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self finishSendingMessageAnimated:YES];
        });
    });
}


- (Class)viewClassForItem:(QBChatMessage *)item {
    
    if (item.senderID == QMMessageTypeContactRequest) {
        
        if (item.senderID != self.senderID) {
            
            return [QMChatContactRequestCell class];
        }
    }
    
    else if (item.senderID == QMMessageTypeRejectContactRequest) {
        
        return [QMChatNotificationCell class];
    }
    
    else if (item.senderID == QMMessageTypeAcceptContactRequest) {
        
        return [QMChatNotificationCell class];
    }
    else {
        
        if (item.senderID != self.senderID) {
            if ((item.attachments != nil && item.attachments.count > 0)) {
                return [QMChatAttachmentIncomingCell class];
                //return [QMChatAttachmentIncomingCell class];
            } else {
                return [QMChatIncomingCell class];
            }
        } else {
            if ((item.attachments != nil && item.attachments.count > 0)) {
                return [QMChatAttachmentOutgoingCell class];
            } else {
                return [QMChatOutgoingCell class];
            }
        }
    }
    
    return nil;
}

- (CGSize)collectionView:(QMChatCollectionView *)collectionView dynamicSizeAtIndexPath:(NSIndexPath *)indexPath maxWidth:(CGFloat)maxWidth {
    
    QBChatMessage *item = [self.chatSectionManager messageForIndexPath:indexPath];
    Class viewClass = [self viewClassForItem:item];
    CGSize size;
    
    if (viewClass == [QMChatAttachmentIncomingCell class] || viewClass == [QMChatAttachmentOutgoingCell class]) {
        size = CGSizeMake(MIN(200, maxWidth), 200);
    } else {
        NSAttributedString *attributedString = [self attributedStringForItem:item];
        
        size = [TTTAttributedLabel sizeThatFitsAttributedString:attributedString
                                                withConstraints:CGSizeMake(maxWidth, MAXFLOAT)
                                         limitedToNumberOfLines:0];
    }
    
    return size;
}

- (CGFloat)collectionView:(QMChatCollectionView *)collectionView minWidthAtIndexPath:(NSIndexPath *)indexPath {
    
    QBChatMessage *item = [self.chatSectionManager messageForIndexPath:indexPath];
    
    CGSize size;
    
    if (item != nil) {
        
        NSAttributedString *attributedString =
        [item senderID] == self.senderID ?  [self bottomLabelAttributedStringForItem:item] : [self topLabelAttributedStringForItem:item];
        
        size = [TTTAttributedLabel sizeThatFitsAttributedString:attributedString
                                                withConstraints:CGSizeMake(1000, 10000)
                                         limitedToNumberOfLines:1];
    }
    
    return size.width;
}

- (void)collectionView:(QMChatCollectionView *)collectionView configureCell:(UICollectionViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    
    if ([cell conformsToProtocol:@protocol(QMChatAttachmentCell)]) {
        QBChatMessage* message = [self.chatSectionManager messageForIndexPath:indexPath];
        
        if (message.attachments != nil) {
            QBChatAttachment* attachment = message.attachments.firstObject;
            NSData *imageData = [NSData dataWithContentsOfFile:attachment.url];
            [(UICollectionViewCell<QMChatAttachmentCell> *)cell setAttachmentImage:[UIImage imageWithData:imageData]];
            
            [cell updateConstraints];
        }
    }
    
    [super collectionView:collectionView configureCell:cell forIndexPath:indexPath];
}

- (QMChatCellLayoutModel)collectionView:(QMChatCollectionView *)collectionView layoutModelAtIndexPath:(NSIndexPath *)indexPath {
    
    QMChatCellLayoutModel layoutModel = [super collectionView:collectionView layoutModelAtIndexPath:indexPath];
    QBChatMessage *item = [self.chatSectionManager messageForIndexPath:indexPath];
    
    layoutModel.avatarSize = CGSizeMake(0.0f, 0.0f);
    
    if (item!= nil) {
        
        NSAttributedString *topLabelString = [self topLabelAttributedStringForItem:item];
        CGSize size = [TTTAttributedLabel sizeThatFitsAttributedString:topLabelString
                                                       withConstraints:CGSizeMake(CGRectGetWidth(self.collectionView.frame), CGFLOAT_MAX)
                                                limitedToNumberOfLines:1];
        layoutModel.topLabelHeight = size.height;
    }
    
    return layoutModel;
}
#pragma mark - XYZTextFormatter

- (NSAttributedString *)attributedStringForItem:(QBChatMessage *)messageItem {
    if ([messageItem.text length] <= 0) {
        return nil;
    }
    BOOL isLocal = ([messageItem senderID] == self.senderID) ;
    return [self.formatter itemLabelAttributedStringForParticipant:isLocal andText:messageItem.text];
}

- (NSAttributedString *)topLabelAttributedStringForItem:(QBChatMessage *)messageItem {
    BOOL isLocal = ([messageItem senderID] == self.senderID) ;
    return [self.formatter topLabelAttributedStringForParticipant:isLocal andNick:messageItem.senderNick];
}

- (NSAttributedString *)bottomLabelAttributedStringForItem:(QBChatMessage *)messageItem
{
    BOOL isLocal = ([messageItem senderID] == self.senderID) ;
    return [self.formatter bottomLabelAttributedStringForParticipant:isLocal andDate:messageItem.dateSent];
}

@end
