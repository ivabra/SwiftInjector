
Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "SwiftInjector"
  s.version      = "1.0.3"
  s.summary      = "Simple dependency injection solution for Cocoa projects"

  s.description  = <<-DESC
                   Simple dependency injection solution for Cocoa projects
                   DESC

  s.homepage     = "https://github.com/ivabra/SwiftInjector"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { "Ivan Brazhnikov" => "samsungpc239@gmail.com" }
   s.social_media_url   = "http://twitter.com/dante_photo"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

   s.ios.deployment_target      = "9.0"
   s.osx.deployment_target      = "10.7"
   s.watchos.deployment_target  = "2.0"
   s.tvos.deployment_target     = "9.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source = { :git => "https://github.com/ivabra/SwiftInjector.git", :tag => "1.0.0" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "SwiftInjector", "SwiftInjector/Classes/**/*.{h,m,swift}"
  s.public_header_files = "SwiftInjector/*.h"

end
