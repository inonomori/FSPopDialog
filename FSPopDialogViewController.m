//
//  FSPopDialogViewController.m
//  PopDialog
//
//  Created by Zhefu Wang on 13-7-23.
//  Copyright (c) 2013年 Finder Studio. All rights reserved.
//

#import "FSPopDialogViewController.h"

#define TLSWAP(A,B) do{\
__typeof__(A) __tmp = (A);\
A = B;\
B = __tmp;\
}while(0)

@interface FSPopDialogViewController ()

@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *questionLabel;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation FSPopDialogViewController

- (UIView*)backGroundView
{
    if (!_backGroundView)
    {
        _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [FSPopDialogViewController getApplicationFrameSize].width, [FSPopDialogViewController getApplicationFrameSize].height)];
        _backGroundView.backgroundColor = [UIColor blackColor];
        _backGroundView.alpha = 0.1;
    }
    return _backGroundView;
}

- (UILabel*)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,40)];
        _titleLabel.contentMode = UIViewContentModeCenter;//UIViewContentModeCenter;
        _titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5f];
        _titleLabel.numberOfLines = 1;
        _titleLabel.adjustsFontSizeToFitWidth=YES;
        _titleLabel.minimumScaleFactor = 0.5;
        _titleLabel.font = [UIFont fontWithName:@"Helvetica" size:30];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
//        _titleLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin);
    }
    _titleLabel.text = self.dialogViewTitle;
    
    return _titleLabel;
}

- (UILabel*)questionLabel
{
    if (!_questionLabel)
    {
        _questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, self.view.bounds.size.width, 160)];
        _questionLabel.backgroundColor = [UIColor clearColor];
        _questionLabel.numberOfLines = 0;
        _questionLabel.contentMode = UIViewContentModeScaleAspectFill;
        _questionLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    _questionLabel.text = self.question;
    return _questionLabel;
}

+ (CGSize)getApplicationFrameSize
{
    CGSize size = [UIScreen mainScreen].applicationFrame.size;
    UIInterfaceOrientation deviceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (deviceOrientation == UIInterfaceOrientationLandscapeLeft || deviceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        TLSWAP(size.width, size.height);
    }
    return size;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.contentMode = UIViewContentModeScaleToFill;
    [self.view setClipsToBounds:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = CGRectMake([FSPopDialogViewController getApplicationFrameSize].width/2, [FSPopDialogViewController getApplicationFrameSize].height/2, 1, 1);
    self.okButton = [[UIButton alloc] initWithFrame:CGRectMake(5, self.size.height-70, 90, 50)];
    self.cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(self.size.width-95, self.size.height-70, 90, 50)];
    self.okButton.backgroundColor = [UIColor colorWithRed:0 green:10/255 blue:1 alpha:1];
    [self.okButton setTitle:self.okButtonTitle forState:UIControlStateNormal];
    self.cancelButton.backgroundColor = [UIColor orangeColor];
    [self.cancelButton setTitle:self.cancelButtonTitle forState:UIControlStateNormal];
    [self.okButton addTarget:self action:@selector(okButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelButton addTarget:self action:@selector(cancelButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    self.okButton.alpha = 0;
    self.okButton.hidden = YES;
    self.cancelButton.alpha = 0;
    self.cancelButton.hidden = YES;
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.questionLabel];
    [self.view addSubview:self.okButton];
    [self.view addSubview:self.cancelButton];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)appear
{
    [UIView animateWithDuration:0.1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.view.frame = CGRectMake(([FSPopDialogViewController getApplicationFrameSize].width-self.size.width)/2-45, ([FSPopDialogViewController getApplicationFrameSize].height-self.size.height)/2-45, self.size.width+90, self.size.height+90);
                         self.backGroundView.alpha = 0.25;
                         self.titleLabel.frame = CGRectMake(0, 0, self.size.width+90, 40);

                     }
                     completion:^(BOOL finished)
     {
         if (finished)
         {
             sleep(1);
             [UIView animateWithDuration:0.15
                                   delay:0
                                 options:UIViewAnimationOptionCurveEaseIn
                              animations:^{
                                  self.view.frame = CGRectMake(([FSPopDialogViewController getApplicationFrameSize].width-self.size.width)/2+40, ([FSPopDialogViewController getApplicationFrameSize].height-self.size.height)/2+40, self.size.width-80, self.size.height-80);
        
                                  self.titleLabel.frame = CGRectMake(0, 0, self.size.width-80, 40);
                                  
                                  self.backGroundView.alpha = 0.5;
                                  
                              }
                              completion:^(BOOL finished)
              {
                  
                  if (finished)
                  {             sleep(1);

                      [UIView animateWithDuration:0.15
                                            delay:0
                                          options:UIViewAnimationOptionCurveEaseOut
                                       animations:^{
                                           self.view.frame = CGRectMake(([FSPopDialogViewController getApplicationFrameSize].width-self.size.width)/2, ([FSPopDialogViewController getApplicationFrameSize].height-self.size.height)/2, self.size.width, self.size.height);
                                           self.backGroundView.alpha = 0.75;
                                       }
                                       completion:^(BOOL finished)
                       {
                           self.okButton.hidden = NO;
                           self.cancelButton.hidden = NO;
                           [UIView animateWithDuration:0.05
                                                 delay:0
                                               options:UIViewAnimationOptionCurveEaseInOut
                                            animations:^{
                                                self.okButton.alpha = 1;
                                                self.cancelButton.alpha = 1;
                                            }
                                            completion:nil
                            ];
                       }
                       ];
                  }
              }];
         }
     }];
    
    
    
    
    
    [self.delegate.view addSubview:self.backGroundView];
    [self.delegate.view addSubview:self.view];
}

- (void)okButtonTouched:(UIButton*)sender
{
    if (self.okBlock)
        self.okBlock();
}

- (void)cancelButtonTouched:(UIButton*)sender
{
    if (self.cancelBlock)
        self.cancelBlock();
}

- (void)disappear
{
    [UIView animateWithDuration:0.35
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backGroundView.alpha = 0;
                         self.view.frame = CGRectMake([FSPopDialogViewController getApplicationFrameSize].width/2, [FSPopDialogViewController getApplicationFrameSize].height/2, 0, 0);
                         
                     }
                     completion:^(BOOL finished){
                         if (finished)
                         {
                             [self.backGroundView removeFromSuperview];
                             [self.view removeFromSuperview];
                         }
                     }];
}

@end
