//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Viktor Krasilnikov
// On: 7/29/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"
#import "StrokeColorViewController.h"

@interface SettingsViewController ()

@property (nonatomic,strong) NSMutableArray *settingsDataSource;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Settings"];
    [self setupViews];
    [self fillInitialDataSources];
    
}

- (void)setupViews {
    // Setup tableView
  
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setScrollEnabled:NO];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"CellId"];
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
    ]];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.settingsDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
    
    cell.textLabel.text = self.settingsDataSource[indexPath.row];
    
    if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellStyleValue1;
        
        UISwitch *aSwitch = [[UISwitch alloc] init];
        [aSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = aSwitch;
        [aSwitch setOn:YES];
        
        
    }
    if (indexPath.row == 1) {
        cell.detailTextLabel.text =  @"#color";
        cell.detailTextLabel.textColor = UIColor.blueColor;
        //cell.detailTextLabel.textColor = [UIColor colorWithHexString:(@"%@", )];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    
    
    return cell;
}

- (void)switchChanged:(id)sender{
    UISwitch *switchControl = sender;
        NSLog( @"The switch is %@", switchControl.on ? @"ON" : @"OFF" );
    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        StrokeColorViewController *vc = [[StrokeColorViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        self.navigationController.navigationBar.tintColor = UIColor.redColor;
    }
}

#pragma mark - Data source init

- (void)fillInitialDataSources {
    self.settingsDataSource = [NSMutableArray arrayWithObjects:@"Draw stories", @"Stroke color", nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
