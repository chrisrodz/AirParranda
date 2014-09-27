//
//  APTableViewController.m
//  AirParranda
//
//  Created by Christian A. Rodriguez on 9/27/14.
//  Copyright (c) 2014 Mai Apps. All rights reserved.
//

#import "APTableViewController.h"
#import <MyoKit/MyoKit.h>

@interface APTableViewController ()

@property (strong, nonatomic) NSArray *instruments;

@end

@implementation APTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.instruments = @[@"Güiro", @"Palitos", @"Requinto", @"Seguidor", @"Tumbador"];
    
    self.connect = [[UIBarButtonItem alloc] initWithTitle:@"Connect" style:UIBarButtonItemStylePlain target:self action:@selector(didTapConnect:)];
    self.navigationItem.rightBarButtonItem = self.connect;
    self.navigationItem.title = @"AirParranda";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"APTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.instruments count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"APTableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.instruments[indexPath.row];
    
    return cell;
}



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Selected");
}


- (void)didTapConnect:(id)sender {
    UINavigationController *settingsController = [TLMSettingsViewController settingsInNavigationController];
    
    [self presentViewController:settingsController animated:YES completion:nil];
}

@end
