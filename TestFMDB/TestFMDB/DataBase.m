//
//  DataBase.m
//  TestFmdb
//
//  Created by lyb on 15/3/13.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "DataBase.h"
#import "People.h"
@implementation DataBase
//创建数据库路径
+(NSString *)loadPath{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/db.sqlite3"];
}
//根据路径创建数据库并打开数据库设置缓存
static FMDatabase *db=nil;
+(BOOL)openDatabase{
    if(!db){
        db=[[FMDatabase alloc]initWithPath:[self loadPath]];
    }
    if(![db open]){
        
        [db close];
        return NO;
    }
    //设置缓存
    [db shouldCacheStatements];
    NSLog(@"设置缓存");
    return YES;
    
}
+(void)editTable:(NSString *)sql{
    //打开数据库并且进行判断
    if([self openDatabase]){
        [db executeUpdate:sql];
        [db close];
    }
    
}

//不管是查询、插入抑或删除都要首先打开数据库，否则无法查询数据
+(void)createTable:(NSString *)name{
    if([self openDatabase]){
        //如果数据库中不存在这个表就创建
        if(![db tableExists:name]){
            NSString *sql=@"create table person(id integer primary key, name text, age integer)";
            [db executeUpdate:sql];
        }
        [db close];
    }
}
+(void)insertName:(NSString *)name andAge:(int)age{
    
    if([self openDatabase]){
        NSString *sql=@"insert into person (name,age) values (?,?)";
        //就算数据库中的字段是integer类型，我们也需要在执行sql时将其转换成nsstring
        [db executeUpdate:sql,name,[NSString stringWithFormat:@"%d",age]];
        [db close];
    }
    
}
+(NSMutableArray *)search{
    NSMutableArray *arr=nil;
    if([self openDatabase]){
        arr=[[NSMutableArray alloc]init];
        NSString *sql=@"select * from person";
        FMResultSet *result=[db executeQuery:sql];
        while ([result next]) {
            People *pe=[[People alloc] init];
            pe.theId=[result intForColumn:@"id"];
            pe.theName=[result stringForColumn:@"name"];
            pe.theAge=[result intForColumn:@"age"];
            [arr addObject:pe];
        }
    }
    return arr;
    
}

//查询记录
+ (NSArray*)selectitemDream_desc:(NSString *)item
{
//    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM pinyinSimple WHERE person like '%@%%'",item];//模糊查询，查找alpha中 以 item.dream_keyword 开头的内容
    if([self openDatabase]){
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM person WHERE age like '%%%@%%'",item];//模糊查询，查询alpha中包含 item.dream_keyword 的内容
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    FMResultSet *rs = [db executeQuery:sql];
    while ([rs next])
    {
        People *pe=[[People alloc] init];
        pe.theId=[rs intForColumn:@"id"];
        pe.theName=[rs stringForColumn:@"name"];
        pe.theAge=[rs intForColumn:@"age"];
        [array addObject:pe];
    }
    return array;
    }
    return nil;
}



@end
