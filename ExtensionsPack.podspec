
Pod::Spec.new do |s|
  s.name             = 'ExtensionsPack'
  s.swift_version    = '4.2'
  s.version          = '1.1.0'
  s.summary          = 'Various handy Swift extensions'

  s.description      = <<-DESC
Extensions for Swift and UIKit that i find useful
                       DESC

  s.homepage         = 'https://github.com/yaro812/ExtensionsPack'
  s.author           = { 'Thorax' => 'thorax@me.com' }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/yaro812/ExtensionsPack.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'ExtensionsPack/*.swift'

end
