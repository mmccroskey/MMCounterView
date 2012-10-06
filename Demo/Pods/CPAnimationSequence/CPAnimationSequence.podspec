#
# Be sure to run `pod spec lint CPAnimationSequence.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec. Optional attributes are commented.
#
# For details see: https://github.com/CocoaPods/CocoaPods/wiki/The-podspec-format
#
Pod::Spec.new do |s|
  s.name         = "CPAnimationSequence"
  s.version      = "0.1.0"
  s.summary      = "mmccroskey's fork of CPAnimationSequence."
  s.homepage     = "http://github.com/mmccroskey/CPAnimationSequence"
  s.author       = { "Matthew McCroskey" => "matthew.mccroskey@gmail.com" }
  s.source       = { :git => "https://github.com/mmccroskey/CPAnimationSequence.git", :tag => "0.1.0" }
  s.license      = { :type => 'MIT', :file => 'LICENSE.markdown' }
  s.platform     = :ios, '4.3'
  s.source_files = 'Component'
  s.frameworks = 'Foundation', 'UIKit', 'CoreGraphics'
  s.requires_arc = true
end
