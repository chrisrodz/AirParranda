//
//  ViewController.m
//  AirParranda
//
//  Created by Xiomara on 9/27/14.
//  Copyright (c) 2014 Mai Apps. All rights reserved.
//

#import "ViewController.h"
#import <MyoKit/MyoKit.h>
#import "APInstrumentViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *requinto;
@property (weak, nonatomic) IBOutlet UIButton *palitos;
@property (weak, nonatomic) IBOutlet UIButton *maracas;
@property (weak, nonatomic) IBOutlet UIButton *guiro;
@property (weak, nonatomic) IBOutlet UIButton *servidor;
@property (weak, nonatomic) IBOutlet UIButton *tumbador;

@end

@implementation ViewController

- (IBAction)requinto:(id)sender {
    
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"requinto";
    [self.navigationController pushViewController:ivc animated:YES];
    
}
- (IBAction)palitos:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"palitos";
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)maracas:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"maracas";
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)guiro:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"guiro";
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)servidor:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"servidor";
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)tumbador:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"tumbador";
    [self.navigationController pushViewController:ivc animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.connect = [[UIBarButtonItem alloc] initWithTitle:@"Connect" style:UIBarButtonItemStylePlain target:self action:@selector(didTapConnect:)];
    self.navigationItem.rightBarButtonItem = self.connect;
    self.navigationItem.title = @"AirParranda";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTapConnect:(id)sender {
    UINavigationController *settingsController = [TLMSettingsViewController settingsInNavigationController];
    
    [self presentViewController:settingsController animated:YES completion:nil];
}

@end
