//
//  ViewController.m
//  Toast
//
//  Created by Thomson on 15/11/24.
//  Copyright © 2015年 Kemi. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Toast.h"

static CGFloat const duration = 2.0;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onButton:(id)sender
{
    [self.view showToastWithText:@"Loading Failed!" time:duration];
}

@end
