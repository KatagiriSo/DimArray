//
//  DimArray.h
//
//  Created by So Katagiri on 12/02/14.
//  Copyright (c) 2012年 Rodhos Soft All rights reserved.
//


#import <Foundation/Foundation.h>

/**
 *  DimArray
 *
 *  2dim Matrix
 *
 *
 */

@interface DimArray : NSObject
@property (nonatomic, readonly) int maxX;
@property (nonatomic, readonly) int maxY;

+ (DimArray *)array;
+ (DimArray *)arrayWith2dimArray:(NSArray *)array;

//int
- (void)setIntValue:(int)value X:(NSUInteger)x Y:(NSUInteger)y;
- (int)intX:(NSUInteger)x Y:(NSUInteger)y;

// object
- (void)setValue:(id)value X:(NSUInteger)x Y:(NSUInteger)y;
- (id)getX:(NSUInteger)x Y:(NSUInteger)y;


- (void)clear;
- (void)read2dimArray:(NSArray *)arrayData;
- (void)log;

@end
