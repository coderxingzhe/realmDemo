//
//  ViewController.m
//  DJDemo
//
//  Created by 段自强 on 2017/3/22.
//  Copyright © 2017年 段自强. All rights reserved.



#import "ViewController.h"
#import "DJPerson.h"
#import "DJDog.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UITextField *field1;
@property (weak, nonatomic) IBOutlet UITextField *field2;
//realm
@property (nonatomic, strong) NSNumber *IDCard;
@property (nonatomic, strong) DJPerson *peron1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self testIQKeyboard];
    [self setupUI];
}

- (void)setupUI
{
    self.btn1.backgroundColor = [UIColor lightGrayColor];
    self.btn2.backgroundColor = [UIColor lightGrayColor];
    self.btn3.backgroundColor = [UIColor lightGrayColor];
    self.btn4.backgroundColor = [UIColor lightGrayColor];
    [self create];
    [self remove];
    [self update];
    [self query];
    
    self.peron1 = [[DJPerson alloc] initWithValue:@[@"1000",@"jay",@"999",@[@"哈士奇",@"黑白色"]]];
    
}

- (void)create
{
    //create
    [self.btn1 setTitle:@"增" forState:UIControlStateNormal];
    [[self.btn1 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        //id
        RLMResults *persons = [DJPerson allObjects];
        DJPerson *personLast = persons.lastObject;
        self.IDCard =  @(personLast.IDCard.intValue + 1);
        
        //personNew
        DJPerson *personNew = [DJPerson new];
        personNew.name = self.field1.text;
        personNew.age = self.field2.text;
        personNew.IDCard = [NSString stringWithFormat:@"%zd",self.IDCard.intValue];
        
        //dog
        DJDog *dog = [DJDog new];
        dog.name = @"牛头梗";
        dog.color = @"五颜六色";
        personNew.dog = dog;
        
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addObject:personNew];
        [realm commitWriteTransaction];
        
        //realm
    }];

}

- (void)remove
{
    //remove
    [self.btn2 setTitle:@"删" forState:UIControlStateNormal];
    [[self.btn2 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        
        //remove ALL
        //[realm deleteAllObjects];
        
        //remove one
        [realm deleteObject:self.peron1];
        
        [realm commitWriteTransaction];
        
        
    }];
}


- (void)update
{
    //update
    [self.btn3 setTitle:@"改" forState:UIControlStateNormal];
    [[self.btn3 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm addOrUpdateObject:self.peron1];
        [realm commitWriteTransaction];
    }];
}


- (void)query
{
    
    [self.btn4 setTitle:@"查" forState:UIControlStateNormal];
    [[self.btn4 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        RLMResults *persons = [DJPerson allObjects];
        for (DJPerson *person in persons)
        {
            NSLog(@"%@",person);
        }
    }];
    
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
