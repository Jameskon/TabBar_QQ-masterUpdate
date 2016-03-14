//
//  SubMessageViewController.h
//  TabBar实例_QQ
//
//  Created by kai on 16/3/14.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubMessageViewController : UIViewController

@property (nonatomic,strong) NSString *headImageStrings;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *message;

- (instancetype)initWithHeadImage :(NSString *)headImageStrings andName :(NSString *)name andMessage :(NSString *)message;

@end
