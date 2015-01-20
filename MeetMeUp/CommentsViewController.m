//
//  CommentsViewController.m
//  MeetMeUp
//
//  Created by Gabriel Borri de Azevedo on 1/19/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "CommentsViewController.h"
#import "Comment.h"

@interface CommentsViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *commentsArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CommentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self searchedTerm];
    self.commentsArray = [NSMutableArray new];
}

-(void)searchedTerm
{
    NSString *urlString = [NSString stringWithFormat:@"http://api.meetup.com/2/event_comments?event_id=219274630&order=time&desc=desc&offset=0&photo-host=public&format=json&page=500&sig_id=%@&sig=facb9966af18d89adf928ff6adcb7c40804af579",self.event.eventID];

    NSURL *url = [NSURL URLWithString:urlString]; // URL of Meetup.com's API

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url]; //request from URL

    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) // start connection
     {
         NSDictionary *meetupDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]; // Dict of JSON
         self.commentsArray = [meetupDictionary objectForKey:@"results"]; // Array of JSON's Dict

         for (NSDictionary *commentDict in self.commentsArray) // for each event in resultsArray
         {
             Comment *newComment = [Comment new]; // creating new event

             NSString *nameString = [commentDict objectForKey:@"member_name"]; // search for name in newEvent's dict
             newComment.name = nameString;

             NSString *commentString = [commentDict objectForKey:@"comment"];
             newComment.comment = commentString;

             NSString *timeString = [commentDict objectForKey:@"time"];
             newComment.time = timeString;

             [self.commentsArray addObject:newComment];
         }
         [self.tableView reloadData]; //reloadData to reload all tableView
     }];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    Comment *currentComment = [self.commentsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = @"test";
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


@end
