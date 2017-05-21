//
// MIT License
//
// Copyright (c) 2016 Tom Hancocks
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#import <XCTest/XCTest.h>
#import "RKRezResourceFile.h"

@interface RKRezResourceFileTests : XCTestCase
@end

@implementation RKRezResourceFileTests

- (NSString *)filePathForRezTestFile:(NSString *)testFile
{
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString *path = [[bundle resourcePath] stringByAppendingPathComponent:@"TestData/Rez"];
    return [path stringByAppendingPathComponent:[testFile stringByAppendingPathExtension:@"rez"]];
}

- (void)test_openRezResourceFile_expectedResult
{
    RKRezResourceFile *rez = [RKRezResourceFile resourceFileWithPath:[self filePathForRezTestFile:@"Test1"]];
    XCTAssertNotNil(rez);
}

- (void)test_rezResourceFile_allTypes_expectedResult
{
    RKRezResourceFile *rez = [RKRezResourceFile resourceFileWithPath:[self filePathForRezTestFile:@"Test1"]];
    NSArray *expectedTypes = @[@"dsïg", @"STR ", @"vers"];
    XCTAssertEqualObjects(rez.allTypes, expectedTypes);
}

@end
