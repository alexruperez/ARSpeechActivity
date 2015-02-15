Pod::Spec.new do |s|
  s.name         = 'ARSpeechActivity'
  s.version      = '0.1.1'
  s.license      = 'MIT'
  s.summary      = 'ARSpeechActivity is a UIActivity subclass that uses AVSpeechUtterance to read aloud the shared NSString.'
  s.homepage     = 'https://github.com/alexruperez/ARSpeechActivity'
  s.author       = { "alexruperez" => "contact@alexruperez.com" }
	s.social_media_url = 'https://twitter.com/alexruperez'
  s.platform     = :ios, '7.0'
  s.source       = { :git => 'https://github.com/alexruperez/ARSpeechActivity.git', :tag => s.version.to_s }
  s.source_files = 'ARSpeechActivity/*.{h,m}'
	s.resources    = 'ARSpeechActivity/*.{png,lproj}'
  s.requires_arc = true
	s.frameworks = 'UIKit'
end