//
//  ViewController.m
//  TestFMDB
//
//  Created by Apple on 16/1/25.
//  Copyright © 2016年 mcas. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

#import "DataBase.h"
#import "People.h"

@interface ViewController (){
    FMDatabaseQueue *queue;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chaxun)];
    [self.view addGestureRecognizer:tap];
    
//    [DataBase createTable:@"person"];
//    [DataBase insertName:@"zhangsan" andAge:12];
//    [DataBase editTable:@"insert into person values(1,'lisi',56)"];
//    [DataBase search];
//    [DataBase editTable:@"delete from person where id=1"];
//    
//    
//    NSMutableArray *arr=[DataBase search];
//    for(People *pe in arr){
//        NSLog(@"%d-----%@----%d",pe.theId,pe.theName,pe.theAge);
//    }
//    NSLog(@"-------home:%@",NSHomeDirectory());
//    
//    [queue inDatabase:^(FMDatabase *db) {
//        FMResultSet *result = [db executeQuery:[NSString stringWithFormat:@""]];
//    }];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//       NSLog(@"------模糊查询：%@",[DataBase selectitemDream_desc:@"lisi"]) ;
//    });
}
//这种查询需要数据库打开,否则上哪里获取数据？
- (void)chaxun{
    NSLog(@"------模糊查询：%@",[DataBase selectitemDream_desc:@"2"]);
    for(People *pe in [DataBase selectitemDream_desc:@"2"]){
        NSLog(@"%d-----%@----%d",pe.theId,pe.theName,pe.theAge);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
