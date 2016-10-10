
Pod::Spec.new do |s|

  s.name         = "swizzleMethod"
  s.version      = "1.0.0"
  s.summary      = "swizzleMethod."

  s.description      = <<-DESC
     swizzle method implement,include instance method and class method.
                       DESC

  s.homepage     = "https://github.com/ObornJung/swizzleMethod"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Oborn.Jung" => "obornjung@gmail.com" }
  s.authors      = { "Oborn.Jung" => "obornjung@gmail.com" }
  
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/ObornJung/swizzleMethod.git", :tag => s.version }

  s.source_files  = "swizzleMethod/**/*.{h,m}"
  s.public_header_files = 'swizzleMethod/**/*.h'
   
  s.frameworks  = "Foundation", "UIKit"

  s.requires_arc = true

end
