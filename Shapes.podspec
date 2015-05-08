
Pod::Spec.new do |s|
  s.name         = "Shapes"
  s.version      = "1.0.2"
  s.summary      = "Framework for drawing and animating shaped views on iOS"

  s.homepage     = "https://github.com/DenHeadless/Shapes"
  s.screenshots  = "https://github.com/DenHeadless/Shapes/raw/master/Images/progress_view.gif", "https://github.com/DenHeadless/Shapes/raw/master/Images/dimming_view.gif","https://github.com/DenHeadless/Shapes/raw/master/Images/app_store_download_button.gif", "https://github.com/DenHeadless/Shapes/raw/master/Images/voice_memos_record_button.gif"

  s.license      = "MIT"
  
  s.author             = { "Denys Telezhkin" => "denys.telezhkin@yandex.ru" }
  s.social_media_url = 'https://twitter.com/DTCoder'

  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/DenHeadless/Shapes.git", :tag => s.version.to_s }

  s.source_files  = "Shapes"

  s.frameworks = "UIKit", "Foundation", "QuartzCore"
  s.requires_arc = true
end
