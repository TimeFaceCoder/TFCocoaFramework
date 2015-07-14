/* Copyright (c) 2014-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ASCellNode.h"

#import <AsyncDisplayKit/_ASDisplayView.h>
#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import <AsyncDisplayKit/ASTextNode.h>


#pragma mark -
#pragma mark ASCellNode

@implementation ASCellNode

- (instancetype)init
{
  if (!(self = [super init]))
    return nil;

  // use UITableViewCell defaults
  _selectionStyle = UITableViewCellSelectionStyleDefault;
  self.clipsToBounds = YES;

  return self;
}

- (instancetype)initWithLayerBlock:(ASDisplayNodeLayerBlock)viewBlock
{
  ASDisplayNodeAssertNotSupported();
  return nil;
}

- (instancetype)initWithViewBlock:(ASDisplayNodeViewBlock)viewBlock
{
  ASDisplayNodeAssertNotSupported();
  return nil;
}

- (void)setLayerBacked:(BOOL)layerBacked
{
  // ASRangeController expects ASCellNodes to be view-backed.  (Layer-backing is supported on ASCellNode subnodes.)
  ASDisplayNodeAssert(!layerBacked, @"ASCellNode does not support layer-backing.");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  ASDisplayNodeAssertMainThread();
  ASDisplayNodeAssert([self.view isKindOfClass:_ASDisplayView.class], @"ASCellNode views must be of type _ASDisplayView");
  [(_ASDisplayView *)self.view __forwardTouchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  ASDisplayNodeAssertMainThread();
  ASDisplayNodeAssert([self.view isKindOfClass:_ASDisplayView.class], @"ASCellNode views must be of type _ASDisplayView");
  [(_ASDisplayView *)self.view __forwardTouchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  ASDisplayNodeAssertMainThread();
  ASDisplayNodeAssert([self.view isKindOfClass:_ASDisplayView.class], @"ASCellNode views must be of type _ASDisplayView");
  [(_ASDisplayView *)self.view __forwardTouchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
  ASDisplayNodeAssertMainThread();
  ASDisplayNodeAssert([self.view isKindOfClass:_ASDisplayView.class], @"ASCellNode views must be of type _ASDisplayView");
  [(_ASDisplayView *)self.view __forwardTouchesCancelled:touches withEvent:event];
}

@end


#pragma mark -
#pragma mark ASTextCellNode

@interface ASTextCellNode () {
  NSString *_text;
  ASTextNode *_textNode;
}

@end


@implementation ASTextCellNode

static const CGFloat kHorizontalPadding = 15.0f;
static const CGFloat kVerticalPadding = 11.0f;
static const CGFloat kFontSize = 18.0f;

- (instancetype)init
{
  if (!(self = [super init]))
    return nil;

  _textNode = [[ASTextNode alloc] init];
  [self addSubnode:_textNode];

  return self;
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
  CGSize availableSize = CGSizeMake(constrainedSize.width - 2 * kHorizontalPadding,
                                    constrainedSize.height - 2 * kVerticalPadding);
  availableSize.width = MAX(0, availableSize.width);
  availableSize.height = MAX(0, availableSize.height);
  CGSize textNodeSize = [_textNode measure:availableSize];

  return CGSizeMake(ceilf(2 * kHorizontalPadding + textNodeSize.width),
                    ceilf(2 * kVerticalPadding + textNodeSize.height));
}

- (void)layout
{
  _textNode.frame = CGRectInset(self.bounds, kHorizontalPadding, kVerticalPadding);
}

- (void)setText:(NSString *)text
{
  if (_text == text)
    return;

  _text = [text copy];
  _textNode.attributedString = [[NSAttributedString alloc] initWithString:_text
                                                               attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kFontSize]}];

  [self invalidateCalculatedSize];
}

@end
