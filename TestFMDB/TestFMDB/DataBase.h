//
//  DataBase.h
//  TestFMDB
//
//  Created by Apple on 16/1/25.
//  Copyright © 2016年 mcas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
@interface DataBase : NSObject

//打开数据库并进行判断
+(void)editTable:(NSString *)sql;

//创建表
+(void)createTable:(NSString *)name;

//插入名字和年龄
+(void)insertName:(NSString *)name andAge:(int)age;

//查找
+(NSMutableArray *)search;

// 模糊查询
+ (NSArray*)selectitemDream_desc:(NSString *)item;

@end
