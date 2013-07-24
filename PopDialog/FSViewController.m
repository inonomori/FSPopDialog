//
//  FSViewController.m
//  PopDialog
//
//  Created by Zhefu Wang on 13-7-23.
//  Copyright (c) 2013年 Finder Studio. All rights reserved.
//

#import "FSViewController.h"

@interface FSViewController ()

@property (nonatomic, strong) FSPopDialogViewController *popDialog;

@end

@implementation FSViewController

- (FSPopDialogViewController*)popDialog
{
    if (!_popDialog)
    {
        _popDialog = [[FSPopDialogViewController alloc] init];
        _popDialog.delegate = self;
    }
    return _popDialog;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPopDialog
{
    self.popDialog.size = CGSizeMake(300, 400);
    self.popDialog.dialogViewTitle = @"Is it OK?";
    self.popDialog.question = @"阿布军没有小鸡鸡，没有小鸡鸡的是阿布。阿布军没有小鸡鸡，没有小鸡鸡的是阿布。阿布军没有小鸡鸡，没有小鸡鸡的是阿布。阿布军没有小鸡鸡，没有小鸡鸡的是阿布。阿布军没有小鸡鸡，没有小鸡鸡的是阿布。阿布军没有小鸡鸡，没有小鸡鸡的是阿布。阿布军没有小鸡鸡，没有小鸡鸡的是阿布。阿布军没有小鸡鸡，没有小鸡鸡的是阿布。";
    self.popDialog.okButtonTitle = @"OK";
    self.popDialog.cancelButtonTitle = @"NO";
    self.popDialog.okBlock = ^{[self.popDialog disappear];};
    self.popDialog.cancelBlock = ^{[self.popDialog disappear];};
    [self.popDialog appear];
}

- (IBAction)showButtonTouched:(UIButton *)sender
{
    self.popDialog.popDialogStyle = FSPopDialogStylePop;
    self.popDialog.disappearDialogStyle = FSPopDialogStylePop;
    [self showPopDialog];
}

- (IBAction)showFromBottomButtonTouched:(UIButton *)sender
{
    self.popDialog.popDialogStyle = FSPopDialogStyleFromBottom;
    self.popDialog.disappearDialogStyle = FSPopDialogStyleFromBottom;
    [self showPopDialog];
}

- (IBAction)showFromTopButtonTouched:(UIButton *)sender
{
    self.popDialog.popDialogStyle = FSPopDialogStyleFromTop;
    self.popDialog.disappearDialogStyle = FSPopDialogStyleFromTop;
    [self showPopDialog];
}

- (IBAction)showFromLeftButtonTouched:(UIButton *)sender
{
    self.popDialog.popDialogStyle = FSPopDialogStyleFromLeft;
    self.popDialog.disappearDialogStyle = FSPopDialogStyleFromLeft;
    [self showPopDialog];
}

- (IBAction)showFromRightButtonTouched:(UIButton *)sender
{
    self.popDialog.popDialogStyle = FSPopDialogStyleFromRight;
    self.popDialog.disappearDialogStyle = FSPopDialogStyleFromRight;
    [self showPopDialog];
}


@end
