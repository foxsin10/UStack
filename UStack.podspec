Pod::Spec.new do |s|

  s.name         = "UStack"
  s.version      = "0.2.0"
  s.summary      = "A tool for use viewbuilder like syntx in UIKit."

  s.description  = <<-DESC
                   A tool for use viewbuilder like syntx in UIKit.
                   
                   DESC

  s.homepage     = "https://github.com/foxsin10/UStack"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.authors            = { "foxsion10" => "yzjcnn@gmail.com" }
  s.social_media_url   = "https://github.com/foxsion10"

  s.swift_versions = ['5.4']

  s.ios.deployment_target = "11.0"

  s.source       = { :git => "https://github.com/foxsin10/UStack.git", :tag => s.version }
  s.source_files  = ["Sources/**/*.swift"]

  s.requires_arc = true
end