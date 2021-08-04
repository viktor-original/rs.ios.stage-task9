//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Viktor Krasilnikov
// On: 7/31/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StrokeColorViewControllerDelegate <NSObject>

-(void)colorOfStrokeDidSelect:(NSString *)color;

@end


@interface StrokeColorViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<StrokeColorViewControllerDelegate> delegate;
@property (nonatomic) NSString *selectedColor;

@end

NS_ASSUME_NONNULL_END
