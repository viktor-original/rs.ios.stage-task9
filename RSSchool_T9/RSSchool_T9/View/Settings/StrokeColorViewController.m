//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Viktor Krasilnikov
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "StrokeColorViewController.h"
#import "UIColor+Hexadecimal.h"

@interface StrokeColorViewController ()

@property (nonatomic,strong) NSMutableArray *colorsDataSource;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation StrokeColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self fillInitialDataSources];
}

// Setup tableView
- (void)setupViews {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellId"];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colorsDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
    
    cell.textLabel.text = self.colorsDataSource[indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithHexString:((void)(@"%@"), cell.textLabel.text)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    [self.delegate colorOfStrokeDidSelect:self.colorsDataSource[indexPath.row]];
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - Data source init

- (void)fillInitialDataSources {
    self.colorsDataSource = [NSMutableArray arrayWithObjects:@"#be2813", @"#3802da", @"#467c24", @"#808080", @"#8e5af7", @"#f07f5a", @"#f3af22", @"#3dacf7", @"#e87aa4", @"#0f2e3f", @"#213711", @"#511307", @"#92003b", nil];
}

@end

