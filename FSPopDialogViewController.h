//
//  FSPopDialogViewController.h
//  PopDialog
//
//  Created by Zhefu Wang on 13-7-23.
//  Copyright (c) 2013年 Finder Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^(FSBlock))(void);

@protocol FSPopDialogProtocol <NSObject>


@end


@interface FSPopDialogViewController : UIViewController

@property (nonatomic, strong) UIViewController<FSPopDialogProtocol> *delegate;
@property (nonatomic) CGSize size;
@property (nonatomic, strong) NSString *dialogViewTitle;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *okButtonTitle;
@property (nonatomic, strong) NSString *cancelButtonTitle;
@property (nonatomic, strong) FSBlock okBlock;
@property (nonatomic, strong) FSBlock cancelBlock;

- (void)appear;
- (void)disappear;

@end
