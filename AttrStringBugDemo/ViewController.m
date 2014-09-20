//
//  ViewController.m
//  AttrStringBugDemo
//
//  Created by reidbelton on 9/20/14.
//  Copyright (c) 2014 Reid Belton. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "NSMutableAttributedString+hilighting.h"
#import "Article.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    NSArray *_titles;
    NSString *_keywords;
    NSMutableArray *_articles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = @[@"Fang, test, more, car, stump", @"Should the Axe...", @"Snowflake"];
    _keywords = @"fang, soldier, axe, snowflake, car";
    _articles = [NSMutableArray array];
    
    [self createArticles];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createArticles
{
    for (NSString *title in _titles) {
        Article *newArticle = [[Article alloc] init];
        newArticle.title = [[NSMutableAttributedString alloc] initWithString:title];
        newArticle.keywords = [[NSMutableAttributedString alloc] initWithString:_keywords];
        [_articles addObject:newArticle];
    }
}

#pragma mark - Search Bar Delegate

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    for (Article *article in _articles) {
        // Reset highlights first
        [article.title removeAttribute:NSBackgroundColorAttributeName range:NSMakeRange(0, article.title.length)];
        [article.keywords removeAttribute:NSBackgroundColorAttributeName range:NSMakeRange(0, article.keywords.length)];
        
        [article.title hilightMatchingSubstring:searchText color:[UIColor blueColor] range:NSMakeRange(0, article.title.length)];
        [article.keywords hilightMatchingSubstring:searchText color:[UIColor blueColor] range:NSMakeRange(0, article.keywords.length)];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Tableview Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _articles.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"customCellID";
    
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    Article *article = _articles[indexPath.row];
    
    cell.myTitleLabel.attributedText = article.title;
    cell.myKeywordLabel.attributedText = article.keywords;
    
    return cell;
}

@end
