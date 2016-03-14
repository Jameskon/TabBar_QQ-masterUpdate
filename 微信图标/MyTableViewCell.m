//
//  MyTableViewCell.m
//  TabBar实例_QQ
//
//  Created by kai on 16/3/10.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        _headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(4, 4, 60, 60)];
        _headerImage.contentMode = UIViewContentModeScaleAspectFit;
        _headerImage.layer.cornerRadius = 30;
//        _headerImage.clipsToBounds = YES;
        [self addSubview:_headerImage];
        
        _nikeName = [[UILabel alloc]initWithFrame:CGRectMake(68, 4, self.frame.size.width - 68 - 8 - 30, 30)];
        [self addSubview:_nikeName];
        
        _time = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 4, 4, 50, 30)];
        [self addSubview:_time];
        
        _message = [[UILabel alloc]initWithFrame:CGRectMake(68, 40, self.frame.size.width - 68 - 30 - 4 -4, 16)];
        [self addSubview:_message];
        
        _number = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 4, 36, 50, 30)];
        [self addSubview:_number];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
