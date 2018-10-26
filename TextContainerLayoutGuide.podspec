Pod::Spec.new do |s|
  s.name             = 'TextContainerLayoutGuide'
  s.version          = '0.2.0'
  s.summary          = 'Easily put something around text using AutoLayout.'
  s.description      = <<-DESC
Easily put something around text using AutoLayout.
                       DESC

  s.homepage         = 'https://github.com/noppefoxwolf/TextContainerLayoutGuide'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'noppefoxwolf' => 'noppelabs@gmail.com' }
  s.source           = { :git => 'https://github.com/noppefoxwolf/TextContainerLayoutGuide.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/noppefoxwolf'

  s.ios.deployment_target = '11.0'

  s.source_files = 'TextContainerLayoutGuide/Classes/**/*'
  s.swift_version = '4.2'
end
