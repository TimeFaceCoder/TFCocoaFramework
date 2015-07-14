//
//  TFViewController.m
//  TFCocoaFramework
//
//  Created by Melvin on 5/28/15.
//  Copyright (c) 2015 TimeFace. All rights reserved.
//

#import "TFViewController.h"

@interface TFViewController() {
    
}

@end

@implementation TFViewController {
    
}

#pragma mark - Life cycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    if (nil != self.nibName) {
        [super loadView];
    } else {
        self.view = [[UIView alloc] init];
        self.view.autoresizesSubviews = YES;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark -

#pragma mark - Memory Warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Actions


- (void)onViewClick:(id)sender {
    
}
#pragma mark - Delegates

@end
