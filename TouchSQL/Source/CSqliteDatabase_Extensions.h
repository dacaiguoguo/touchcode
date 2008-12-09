//
//  CSqliteDatabase_Extensions.h
//  DBTest
//
//  Created by Jonathan Wight on Tue Apr 27 2004.
//  Copyright (c) 2004 Jonathan Wight
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "CSqliteDatabase.h"

@interface CSqliteDatabase (CSqliteDatabase_Extensions)

- (NSDictionary *)rowForExpression:(NSString *)inExpression error:(NSError **)outError;

- (NSArray *)valuesForExpression:(NSString *)inExpression error:(NSError **)outError;

- (id)valueForExpression:(NSString *)inExpression error:(NSError **)outError;

- (NSError *)currentError;

@end

#pragma mark -

@interface CSqliteDatabase (CSqliteDatabase_Configuration)

- (NSString *)integrityCheck;

@property (readwrite, assign) int cacheSize;
@property (readwrite, assign) int synchronous;
@property (readwrite, assign) int tempStore;

@end

