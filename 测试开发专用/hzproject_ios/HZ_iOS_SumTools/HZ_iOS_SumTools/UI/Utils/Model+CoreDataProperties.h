//
//  Model+CoreDataProperties.h
//  HZ_iOS_SumTools
//
//  Created by jason on 17/1/9.
//  Copyright © 2017年 admin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface Model (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *age;
@property (nullable, nonatomic, retain) NSString *sex;
@property (nullable, nonatomic, retain) NSString *height;
@property (nullable, nonatomic, retain) NSString *weight;
@property (nullable, nonatomic, retain) NSString *direction;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
