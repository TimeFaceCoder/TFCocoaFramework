Pod::Spec.new do |s|
  s.name         = "TFCocoaFramework"
  s.version      = "0.0.1"
  s.summary      = "时光流影iOS开发框架"
  s.homepage     = "https://github.com/TimeFaceCoder/TFCocoaFramework"
  s.license      = "Copyright (C) 2015 TimeFace, Inc.  All rights reserved."
  s.author             = { "Melvin" => "yangmin@timeface.cn" }
  s.social_media_url   = "http://www.timeface.cn"
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/TimeFaceCoder/TFCocoaFramework.git"}
  s.source_files  = "TFCocoaFramework/**/*.{h,m}"
  s.requires_arc = true
  s.dependency 'SDWebImage'
  s.dependency 'KVOController'
  s.dependency 'SSKeychain'
  s.dependency 'pop'
  s.dependency 'JSONModel'
  s.dependency 'AFNetworking'
  s.dependency 'RETableViewManager'
  s.dependency 'TTTAttributedLabel'
  s.dependency 'HHRouter'
  s.dependency 'JDStatusBarNotification'
  s.dependency 'NJKWebViewProgress'
  s.dependency 'GPUImage'
  s.dependency 'EGOCache'
  s.dependency 'ActionSheetPicker-3.0'
  s.dependency 'Masonry'
  s.dependency 'AsyncDisplayKit'
end
