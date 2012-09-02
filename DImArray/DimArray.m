//
//  DimArray.m
//
//  Created by So Katagiri  on 12/02/14.
//  Copyright (c) 2012年 Rodhos Soft. All rights reserved.
//

#import "DimArray.h"

@implementation DimArray {
    NSMutableDictionary *data;
    int maxX;
    int maxY;
}

@synthesize maxX,maxY;

+ (DimArray *)array
{
   return [[DimArray alloc] init];
}

+ (DimArray *)arrayWith2dimArray:(NSArray *)array
{
    DimArray *da = [DimArray array];
    [da read2dimArray:array];
    return da;
}

- (DimArray *)init
{
    self = [super init];
    if (self) {
        data = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSString *)getKeyX:(NSUInteger)x Y:(NSUInteger)y
{
   return [NSString stringWithFormat:@"%d&%d",x,y];
}

- (void)setIntValue:(int)value X:(NSUInteger)x Y:(NSUInteger)y
{
    if (maxX<x) {
        maxX = x;
    }
    if  (maxY<y) {
        maxY = y;
    }
    NSString *key = [self getKeyX:x Y:y];
    if (key && value) {
        [data setObject:@(value) forKey:key];
    } else {
        NSLog(@"[Error]setIntValue:%d X:%d Y:%d", value, x, y);
    }
}

- (void)setValue:(id)value X:(NSUInteger)x Y:(NSUInteger)y
{
    if (maxX<x) {
        maxX = x;
    }
    if  (maxY<y) {
        maxY = y;
    }
    
    if (!value) {
        NSLog(@"[Error]setValue nil X:%d Y:%d",x,y);
        return;
    }
    
    NSString *key = [self getKeyX:x Y:y];
    if (!key) {
        NSLog(@"[Error]setValue noKey");
        return;
    }
    [data setObject:value forKey:key];
}

- (id)getX:(NSUInteger)x Y:(NSUInteger)y
{
    return [data objectForKey:[self getKeyX:x Y:y]];
}

- (int)intX:(NSUInteger)x Y:(NSUInteger)y
{
   return [[self getX:x Y:y] intValue];
}

- (void)clear
{
    maxX = 0;
    maxY = 0;
    [data removeAllObjects];
}

- (void)read2dimArray:(NSArray *)arrayData
{
    [self clear];
    int y=0;
    for (NSArray *lines in arrayData) {
        int x=0;
        for (NSNumber *num in lines) {
            int value = [num intValue];
            [self setIntValue:value X:x Y:y];
            x++;
        }
        y++;
    }
}


- (void)log
{
    NSMutableString *line = [NSMutableString string];

    for (int y=0;y<=self.maxY;y++) {
        for (int x=0;x<=self.maxX;x++) {
            id value = [self getX:x Y:y];
            (!value) ? [line appendFormat:@"0"]
            :([value isMemberOfClass:[NSNumber class]]) ? [line appendFormat:@"%d", [value intValue]]
            :[line appendFormat:@"%@", value];
        }
        [line appendString:@"\n"];
    }
    NSLog(@"%@",line);
}


@end
