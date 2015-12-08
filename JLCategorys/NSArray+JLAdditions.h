//
//  NSArray+JLAdditions.h
//  JLCategory
//
//  Created by Jangsy on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Additions)

- (BOOL)emptyAtIndex:(NSInteger)index;

- (id)objectAtSafeIndex:(NSInteger)index;

@end

@interface NSMutableArray (Additions)

- (void)addSafeObject:(id)anObject;

@end
