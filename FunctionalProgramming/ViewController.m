//
//  ViewController.m
//  FunctionalProgramming
//
//  Created by Pavel Samsonov on 18/02/2018.
//  Copyright © 2018 MegaLabs. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+F.h"
#import "NSNumber+F.h"
#import "NSDictionary+F.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *numberArray = [NSArray arrayFrom:1 To:5];
    NSArray *numberNamesArray = @[@"one", @"two", @"three", @"four", @"five"];
    NSDictionary *numberDict = [NSDictionary dictionaryWithObjects:numberArray forKeys:numberNamesArray];
    
    //each
    
    [numberArray each:^(NSNumber *obj) {
        //        NSLog(@"%ld", [obj integerValue]);
    }];
    
    [numberNamesArray each:^(NSString *obj) {
        //        NSLog(@"%@", obj);
    }];
    
    [numberDict each:^(NSString *key, NSNumber *value) {
        NSLog(@"%@ = %@", key, value);
    }];
    
    //map
    
    NSArray *doubleArray = [numberArray map:^NSNumber *(NSNumber *obj) {
        return [NSNumber numberWithInt:[obj intValue] * 2];
    }];
    
    NSLog(@"\n%@", doubleArray);
    
    NSDictionary *doubleDict = [numberDict map:^NSNumber *(NSString *key, NSNumber *obj) {
        return [NSNumber numberWithInt:[obj intValue] * 2];
    }];
    
    NSLog(@"\n%@", doubleDict);
    
    NSNumber *memo = @0;
    
    //reduce
    
    NSNumber *sumArray = [numberArray reduce:^NSNumber *(NSNumber *memo, NSNumber *obj) {
        return [NSNumber numberWithInt:[memo intValue] + [obj intValue]];
    } withInitialMemo:memo];
    
    NSLog(@"\n%@", sumArray);
    
    NSNumber *sumDict = [numberDict reduce:^NSNumber *(NSNumber *memo, NSString *key, NSNumber *value) {
        return [NSNumber numberWithInt:[value intValue] + [memo intValue]];
    } withInitialMemo:memo];
    
    NSLog(@"\n%@", sumDict);
    
    //filter & reject
    
    NSArray *evenArray = [numberArray filter:^BOOL(NSNumber *obj) {
        return (([obj intValue] % 2) == 0);
    }];
    
    NSLog(@"\n%@", evenArray);
    
    NSDictionary *oddDict = [numberDict reject:^BOOL(NSString *key, NSNumber *value) {
        return (([value intValue] % 2) == 0);
    }];
    
    NSLog(@"\n%@", oddDict);
    
    //valid for all & any
    
    BoolDictionaryBlock isEvenDictBlock = ^BOOL(NSString *key, NSNumber *obj) {
        BOOL isEven = ([obj integerValue] % 2) == 0;
        return isEven;
    };
    
    BoolArrayBlock isEvenArrayBlock = ^BOOL(NSNumber *obj) {
        BOOL isEven = ([obj intValue] % 2) == 0;
        return isEven;
    };
    
    //    NSLog(@"\nAll: Array - %@, Dict - %@", [numberArray isValidForAll:isEvenArrayBlock] , [numberDict isValidForAll:isEvenDictBlock]);
    //    NSLog(@"\nAny: Array - %@, Dict - %@", [numberArray isValidForAny:isEvenArrayBlock], [numberDict isValidForAny:isEvenDictBlock]);
    
    NSNumber *countEvenArray = [numberArray countValidEntries:isEvenArrayBlock];
    NSNumber *countEvenDict = [numberDict countValidEntries:isEvenDictBlock];
    
    NSLog(@"Valid count: Array - %@, Dict - %@", countEvenArray, countEvenDict);
    
    //drop while
    
    NSArray *dropWhileArr = [numberArray dropWhile:^BOOL(NSNumber *obj) {
        return ([obj intValue] < 3);
    }];
    
    NSLog(@"Array to 3: %@", dropWhileArr);
    
    //sort & reverse
    
    NSArray *reversedArray = [numberArray reverse];
    NSArray *sortedArray = [reversedArray sort:^NSComparisonResult(NSNumber  *_Nonnull obj1, NSNumber  *_Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    NSLog(@"Before sort: %@, after: %@", reversedArray, sortedArray);
    
    //group
    
    NSArray *oddEvenArr = [numberArray group:^NSString *(NSNumber *obj) {
        if (([obj intValue] % 2) == 0) {
            return @"even";
        } else {
            return @"odd";
        }
    }];
    
    NSLog(@"%@", oddEvenArr);
    
    //times
    
    NSNumber *howMany = [numberArray lastObject];
    
    [howMany times:^{
        NSLog(@"Have I told u?");
    }];
    
    //flattern
    
    NSArray *arrWithArrays = @[@[@1,@2,@3], @[@4,@5,@6]];
    NSArray *flatternArr = [arrWithArrays flatten];
    
    NSLog(@"FlatternArr = %@", flatternArr);
    
    //until & after
    
    NSArray *untilThree = [numberArray arrayUntilIndex:3];
    NSArray *afterThree = [numberArray arrayFromIndexOn:3];
    
    NSLog(@"Before 3: %@, after: %@", untilThree, afterThree);
    
    NSArray *bindArray = [arrWithArrays bind:^NSArray *(id obj) {
        return obj;
    }];
    
    NSLog(@"%@", bindArray);
    
    NSArray *zipArr = [numberArray zip:flatternArr];
    NSLog(@"%@", zipArr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
