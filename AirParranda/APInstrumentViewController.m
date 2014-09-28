//
//  APInstrumentViewController.m
//  AirParranda
//
//  Created by Christian A. Rodriguez on 9/27/14.
//  Copyright (c) 2014 Mai Apps. All rights reserved.
//

#import "APInstrumentViewController.h"
#import <MyoKit/MyoKit.h>

@interface APInstrumentViewController ()

@end


@implementation APInstrumentViewController

@synthesize name;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.instrumentName.text = self.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
