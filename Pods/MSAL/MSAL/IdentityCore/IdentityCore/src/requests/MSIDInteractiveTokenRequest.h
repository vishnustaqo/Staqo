// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>
#import "MSIDInteractiveAuthorizationCodeRequest.h"
#import "MSIDInteractiveRequestControlling.h"

@protocol MSIDCacheAccessor;
@class MSIDTokenResponseValidator;
@class MSIDAccountMetadataCacheAccessor;
@class MSIDTokenResult;
@class MSIDWebWPJResponse;
@class MSIDInteractiveTokenRequestParameters;
@class MSIDOauth2Factory;
#if TARGET_OS_OSX
@class MSIDExternalAADCacheSeeder;
#endif

NS_ASSUME_NONNULL_BEGIN

@interface MSIDInteractiveTokenRequest : MSIDInteractiveAuthorizationCodeRequest <MSIDInteractiveRequestControlling>

#if TARGET_OS_OSX
@property (nonatomic, nullable) MSIDExternalAADCacheSeeder *externalCacheSeeder;
#endif

- (nullable instancetype)initWithRequestParameters:(MSIDInteractiveTokenRequestParameters *)parameters
                                      oauthFactory:(MSIDOauth2Factory *)oauthFactory
                            tokenResponseValidator:(MSIDTokenResponseValidator *)tokenResponseValidator
                                        tokenCache:(id<MSIDCacheAccessor>)tokenCache
                              accountMetadataCache:(nullable MSIDAccountMetadataCacheAccessor *)accountMetadataCache;

@end

NS_ASSUME_NONNULL_END
