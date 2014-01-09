Pod::Spec.new do |spec|
  spec.name         = 'ARSpeechActivity'
  spec.version      = '0.0.1'
  spec.license      = 'MIT'
  spec.summary      = 'ARSpeechActivity is a UIActivity subclass that uses AVSpeechUtterance to read aloud the shared NSString.'
  spec.homepage     = 'https://github.com/alexruperez/ARSpeechActivity'
  spec.author       = 'Alex Ruperez'
  spec.platform     = :ios, '7.0'
  spec.source       = { :git => 'https://github.com/alexruperez/ARSpeechActivity.git', :tag => 'v0.0.1' }
  spec.source_files = 'ARSpeechActivity/*.{h,m}'
  spec.resources    = 'ARSpeechActivity/*.{png,lproj}'
  spec.requires_arc = true
end