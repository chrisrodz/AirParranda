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
@property (weak, nonatomic) IBOutlet UIButton *banjo;
@property (weak, nonatomic) IBOutlet UIButton *redoble;
@property (weak, nonatomic) IBOutlet UIButton *campana;

@end

@implementation ViewController

- (IBAction)requinto:(id)sender {
    
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"requinto";
    UIImage *image = [UIImage imageNamed:@"requinto.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(100, 200, 100, 100)];
    [ivc.view addSubview:imageView];
    [self.navigationController pushViewController:ivc animated:YES];
    
}
- (IBAction)palitos:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"palitos";
    [ivc.instrument setText:@"palitos"];
    UIImage *image = [UIImage imageNamed:@"palitos.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    [imageView setFrame:CGRectMake(100, 200, 100, 100)];
    [ivc.view addSubview:imageView];
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)maracas:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"maracas";
    UIImage *image = [UIImage imageNamed:@"maracas.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(100, 200, 100, 100)];
    [ivc.view addSubview:imageView];
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)guiro:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"guiro";
    UIImage *image = [UIImage imageNamed:@"guiro.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(100, 200, 100, 100)];
    [ivc.view addSubview:imageView];
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)servidor:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"servidor";
    UIImage *image = [UIImage imageNamed:@"seguidor.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(100, 200, 100, 100)];
    [ivc.view addSubview:imageView];
    [self.navigationController pushViewController:ivc animated:YES];
}
- (IBAction)tumbador:(id)sender {
    APInstrumentViewController *ivc = [[APInstrumentViewController alloc] init];
    
    ivc.name = @"tumbador";
    UIImage *image = [UIImage imageNamed:@"tumbador.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:CGRectMake(100, 200, 100, 100)];
    [ivc.view addSubview:imageView];
    [self.navigationController pushViewController:ivc animated:YES];
}

- (IBAction)banjo:(id)sender {
}

- (IBAction)redoble:(id)sender {
}
- (IBAction)campana:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.connect = [[UIBarButtonItem alloc] initWithTitle:@"Connect" style:UIBarButtonItemStylePlain target:self action:@selector(didTapConnect:)];
    self.connect.tintColor = [UIColor whiteColor]; 
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
