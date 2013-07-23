//
//  FSViewController.m
//  PopDialog
//
//  Created by Zhefu Wang on 13-7-23.
//  Copyright (c) 2013年 Finder Studio. All rights reserved.
//

#import "FSViewController.h"

@interface FSViewController ()

@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showDialog];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showDialog
{
    FSPopDialogViewController *dialog = [[FSPopDialogViewController alloc] init];
    dialog.delegate = self;
    dialog.size = CGSizeMake(200, 300);
    dialog.dialogViewTitle = @"Is it OK?";
    dialog.question = @"click OK to continue, or NO to cancel";
    dialog.okButtonTitle = @"OK";
    dialog.cancelButtonTitle = @"NO";
    dialog.okBlock = ^{[dialog disappear];};
    [dialog appear];
}

- (IBAction)showButtonTouched:(UIButton *)sender
{
    [self showDialog];
}

@end
