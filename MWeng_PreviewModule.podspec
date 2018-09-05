#
# Be sure to run `pod lib lint MWeng_PreviewModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MWeng_PreviewModule'
  s.version          = '1.0.0'
  s.summary          = '预览组件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/iosliutingxin/MWeng_PreviewModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iosliutingxin' => '1778714848@qq.com' }
  s.source           = { :git => 'https://github.com/iosliutingxin/MWeng_PreviewModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MWeng_PreviewModule/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MWeng_PreviewModule' => ['MWeng_PreviewModule/Assets/*.png']
  # }
  s.swift_version = '4.0'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.resources = 'MWeng_PreviewModule/Assets/*.png','MWeng_PreviewModule/Classes/**/*.{xib,storyboard}'

  #对系统framework的依赖
  s.framework = 'SystemConfiguration','CoreData'
  #对系统.a的依赖，注意去掉lib前缀
  s.libraries   = 'c++','stdc++.6.0.9'
  #s.dependency  'UZMeidator'
  s.dependency 'AFNetworking'
  s.dependency 'UZMeidator'
  
  #pod update --no-repo-update

end
