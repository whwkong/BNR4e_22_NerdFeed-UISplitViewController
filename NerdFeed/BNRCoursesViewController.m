//
//  BNRCoursesViewController.m
//  NerdFeed
//
//  Created by William Kong on 2014-06-20.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRCoursesViewController.h"

@interface BNRCoursesViewController()
@property (nonatomic) NSURLSession *session;
@property (nonatomic, copy) NSArray *courses;
@end

@implementation BNRCoursesViewController

#pragma mark - Controller lifecycle
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"BNR Courses";
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
        
        [self fetchFeed];
    }
    
    return self;
}


#pragma mark - tableView methods
- (NSInteger)tableView:(UITableView*)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark -
- (void)fetchFeed
{
    NSString *requestString = @"http://bookapi.bignerdranch.com/courses.json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req
                                                     completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
//                                          NSString *json = [[NSString alloc] initWithData:data
//                                                                                 encoding:NSUTF8StringEncoding];
//                                          NSLog(@"%@",json);
                                          NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                                     options:0
                                                                                                       error:nil];
                                          // NSLog(@"%@",jsonObject);
                                          self.courses = jsonObject[@"courses"];
                                          NSLog(@"%@", self.courses);
                                      }];
    [dataTask resume];
}

@end
