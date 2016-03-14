//
//  MyTableViewCell.h
//  TabBar实例_QQ
//
//  Created by kai on 16/3/10.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *headerImage;
@property (nonatomic,strong) UILabel *nikeName;
@property (nonatomic,strong) UILabel *message;
@property (nonatomic,strong) UILabel *time;
@property (nonatomic,strong) UILabel *number;

- (instancetype)init;

@end
