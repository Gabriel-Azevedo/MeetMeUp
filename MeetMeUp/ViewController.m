//
//  ViewController.m
//  MeetMeUp
//
//  Created by Gabriel Borri de Azevedo on 1/19/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "ViewController.h"
#import "MeetUpEvent.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSArray *resultArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self searchedTerm];
}

-(void)searchedTerm
{
    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=4d386b18732a5c314f6d5b4d4b7832"]; // URL of Meetup.com's API

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url]; //request from URL

    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) // start connection
     {
         NSDictionary *meetupDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]; // Dict of JSON
         self.resultArray = [meetupDictionary objectForKey:@"results"]; // Array of JSON's Dict
         [self.tableView reloadData]; //reloadData to reload all tableView
     }];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"]; //reuse cell

    MeetUpEvent *newEvent = [MeetUpEvent new]; // creating new event
    newEvent.eventDictionary = [self.resultArray objectAtIndex:indexPath.row]; //assigning the whole dict to the new event

    NSString *nameString = [newEvent.eventDictionary objectForKey:@"name"]; // search for name in newEvent's dict

    NSDictionary *detailDict = [newEvent.eventDictionary objectForKey:@"venue"]; //search for venue in newEvent's dict
    NSString *detailString = [detailDict objectForKey:@"address_1"]; //take first address from venue

    cell.detailTextLabel.text = detailString; //assign address to cell's details

    cell.textLabel.text = nameString; //assign name to cell's title

    return cell; // return cell
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultArray.count; //create cell for "x" numbers of events.
}

@end
