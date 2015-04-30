//
//  MasterViewController.m
//  CocoaHeadsBnuDemo
//
//  Created by João Paulo Ros on 30/04/15.
//  Copyright (c) 2015 PremierSoft. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <Parse/Parse.h>

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.objects = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Eventos"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
       if(!error)
       {
           [self.objects removeAllObjects];
           [self.objects addObjectsFromArray:objects];
           [self.tableView reloadData];
       }
        else
        {
            [[[UIAlertView alloc] initWithTitle:@"CocoaHeads"
                                       message:@"Não foi possível obter dados!"
                                      delegate:nil
                             cancelButtonTitle:@"OK"
                              otherButtonTitles:nil, nil] show];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *object = self.objects[indexPath.row];
    cell.textLabel.text = [object objectForKey:@"title"];
    return cell;
}

@end
