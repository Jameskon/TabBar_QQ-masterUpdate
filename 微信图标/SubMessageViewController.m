//
//  SubMessageViewController.m
//  TabBar实例_QQ
//
//  Created by kai on 16/3/14.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "SubMessageViewController.h"

@interface SubMessageViewController ()

@end

@implementation SubMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithHeadImage :(NSString *)headImageStrings andName :(NSString *)name andMessage :(NSString *)message
{
    if (self = [super init]) {
        CGFloat padding = 10;
        UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(padding,padding, 50, 50)];
        headImageView.image = [UIImage imageNamed:headImageStrings];
        headImageView.clipsToBounds = YES;
        headImageView.layer.cornerRadius = 25;
        [self.view addSubview:headImageView];
        
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(50+padding*2, padding, 120, 20)];
        nameLabel.text = name;
        [self.view addSubview:nameLabel];
        
        UILabel *messageLabel = [[UILabel alloc]initWithFrame:CGRectMake(50+padding*2, padding*2+20,self.view.frame.size.width-padding*3-50, 50)];
        messageLabel.text = message;
        messageLabel.textAlignment = NSTextAlignmentJustified;
        [self.view addSubview:messageLabel];
        
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
