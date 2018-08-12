//
//  JHFirstViewController.m
//  JHBuriedPoint
//
//  Created by zhongan on 2018/8/12.
//  Copyright © 2018年 muma. All rights reserved.
//

#import "JHFirstViewController.h"
#import "UIView+JHBuriedPoint.h"

@interface JHFirstViewController () <UITextFieldDelegate>

@end

@implementation JHFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"First";
    [self initSubView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)initSubView {
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:bgView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    textField.backgroundColor = [UIColor greenColor];
    textField.delegate = self;
    [textField addTarget:self action:@selector(textFieldDiddChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:textField];
    
    UISwitch *sBtn = [[UISwitch alloc] initWithFrame:CGRectMake(100, 400, 100, 50)];
    sBtn.enabled = YES;
    [sBtn addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sBtn];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(100, 500, 100, 100)];
    greenView.backgroundColor = [UIColor blueColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchTag:)];
    [greenView addGestureRecognizer:tap];
    [self.view addSubview:greenView];
}

- (void)touchTag:(UITapGestureRecognizer *)recognizer {
    
}

- (void)textFieldDiddChange {
    
}

- (void)switchAction:(UIControl *)btn {
    
}

- (void)touchBtn:(UIButton *)btn {
//    NSLog(@"%@", [btn superPath]);
    NSLog(@"%@", [btn responderPath]);
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

@implementation JHFirstViewController (TextFieldDelegate)

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"==textFieldShouldBeginEditing==");
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"==textFieldDidBeginEditing==");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"==textFieldShouldEndEditing==");
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"==textFieldDidEndEditing==");
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason NS_AVAILABLE_IOS(10_0) {
    NSLog(@"==textFieldDidEndEditing reason==");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"==shouldChangeCharactersInRange==");
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    NSLog(@"==textFieldShouldClear==");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"==textFieldShouldReturn==");
    return YES;
}

@end
