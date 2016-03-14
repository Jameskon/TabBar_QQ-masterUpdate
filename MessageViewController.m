//
//  MessageViewController.m
//  TabBar实例_QQ
//
//  Created by kai on 16/3/9.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "MessageViewController.h"
#import "MyTableViewCell.h"
#import "SubMessageViewController.h"

@interface MessageViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *messageTable;

@property (nonatomic,strong) NSArray *nameArray;
@property (nonatomic,strong) NSArray *messageArray;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化messageTable
    _messageTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height - 94) style:UITableViewStylePlain];
    _messageTable.delegate = self;
    _messageTable.dataSource = self;
    [self.view addSubview:_messageTable];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:82/255.f green:187/255.f blue:251/255.f alpha:1.0];
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"消息",@"电话", nil]];
    self.navigationItem.titleView = seg;
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    image.image = [UIImage imageNamed:@"logo"];
    image.layer.cornerRadius = 22;
    
    // 给imageView添加手势
    
    image.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImage:)];
    
    [image addGestureRecognizer:tap];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:image];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBtn:)];
    self.view.backgroundColor = [UIColor redColor];
    
    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 30)];
    [self.view addSubview:search];
    // Do any additional setup after loading the view.
}

// 选择第indexPath区块行的cell代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    // 选择哪个区块
//    indexPath.section
//    // 选择哪一行
//    indexPath.row
    
    SubMessageViewController *sub = [[SubMessageViewController alloc]initWithHeadImage:[NSString stringWithFormat:@"%ld.jpg",indexPath.row+1] andName:self.nameArray[indexPath.row] andMessage:self.messageArray[indexPath.row]];
    self.tabBarController.tabBar.hidden = YES;
    [self.navigationController pushViewController:sub animated:YES];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (NSArray *)nameArray
{
    if (!_nameArray) {
        _nameArray = [NSArray arrayWithObjects:@"李灿",@"梁辉",@"温良华",@"赖健亮",@"杨金发",@"龚博",@"杨宣",@"卢伟奇",@"陈根秀",@"老卡", nil];
    }
    return _nameArray;
}

- (NSArray *)messageArray
{
    if (!_messageArray) {
        _messageArray = @[@"你若安好，便是晴天",@"我们分手吧",@"支付宝有钱吗，我要买东西",@"…",@"今天下午一点半交教工处查课，请同学们遵守纪律！",@"你若安好，便是晴天",@"我们分手吧",@"支付宝有钱吗，我要买东西",@"…",@"今天下午一点半交教工处查课，请同学们遵守纪律！"];
    }
    return _messageArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuse = @"123";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[MyTableViewCell alloc]init];
    }
    cell.headerImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",(int)indexPath.row+1]];
    
//    NSArray *nameArray = [NSArray arrayWithObjects:@"李灿",@"梁辉",@"温良华",@"赖健亮",@"杨金发",@"龚博",@"杨宣",@"卢伟奇",@"陈根秀",@"老卡", nil];
    
    cell.nikeName.text = self.nameArray[indexPath.row];
    cell.headerImage.clipsToBounds = YES;
    
    cell.time.text = @"10:24";
    cell.time.textAlignment = NSTextAlignmentRight;
    cell.time.font = [UIFont fontWithName:@"Arial" size:10];
    cell.time.textColor = [UIColor grayColor];
    
    cell.number.text = @"①";
    cell.number.textAlignment = NSTextAlignmentRight;
    
//    NSArray * messageArray = @[@"你若安好，便是晴天",@"我们分手吧",@"支付宝有钱吗，我要买东西",@"…",@"今天下午一点半交教工处查课，请同学们遵守纪律！",@"你若安好，便是晴天",@"我们分手吧",@"支付宝有钱吗，我要买东西",@"…",@"今天下午一点半交教工处查课，请同学们遵守纪律！"];
    cell.message.text = self.messageArray[indexPath.row];
    cell.message.font = [UIFont systemFontOfSize:11];
    cell.message.textColor = [UIColor grayColor];
    
//    cell.textLabel.text = @"AngelaBaby";
    return cell;

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}

- (void)clickImage:(UITapGestureRecognizer *)tap
{
    NSLog(@"taped");
}

- (void)rightBtn:(UIButton *)sender
{
    NSLog(@"11");
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
