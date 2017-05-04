//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "TTTableTextItem.h"

// Core
#import "TTCorePreprocessorMacros.h"


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TTTableTextItem

@synthesize text = _text;
@synthesize textColor = _textColor;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
  TT_RELEASE_SAFELY(_text);
    TT_RELEASE_SAFELY(_textColor);
  [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithText:(NSString*)text {
  TTTableTextItem* item = [[[self alloc] init] autorelease];
  item.text = text;
  return item;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithText:(NSString*)text URL:(NSString*)URL {
  TTTableTextItem* item = [[[self alloc] init] autorelease];
  item.text = text;
  item.URL = URL;
  return item;
}

+ (id)itemWithText:(NSString*)text URL:(NSString*)URL color:(UIColor *)textColor {
    TTTableTextItem* item = [[[self alloc] init] autorelease];
    item.text = text;
    item.URL = URL;
    item.textColor = textColor;
    return item;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithText:(NSString*)text URL:(NSString*)URL accessoryURL:(NSString*)accessoryURL {
  TTTableTextItem* item = [[[self alloc] init] autorelease];
  item.text = text;
  item.URL = URL;
  item.accessoryURL = accessoryURL;
  return item;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithText:(NSString*)text delegate:(id)delegate selector:(SEL)selector {
  TTTableTextItem* item = [[[self alloc] init] autorelease];
  item.text = text;
  item.delegate = delegate;
  item.selector = selector;
  return item;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSCoding


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder*)decoder {
	self = [super initWithCoder:decoder];
  if (self) {
    self.text = [decoder decodeObjectForKey:@"text"];
  }
  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)encodeWithCoder:(NSCoder*)encoder {
  [super encodeWithCoder:encoder];
  if (self.text) {
    [encoder encodeObject:self.text forKey:@"text"];
  }
}


@end

