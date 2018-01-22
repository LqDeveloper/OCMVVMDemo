

Pod::Spec.new do |s|



  s.name         = "LQKMVVMKit"
  s.version      = "0.0.1"
  s.summary      = "This is Framework for OC APP"

  s.description  = <<-DESC
                       this is  Framework for OC
                   DESC

  s.homepage     = "https://github.com/lqIphone/OCMVVMDemo.git"

  s.license      = "MIT"

#s.license      = { :type => "MIT"， :file => "LICENSE" }

  s.author             = { "lqIphone" => "1083099465@qq.com" }

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/lqIphone/OCMVVMDemo.git", :commit => "19f9736e110fc1b" }




  s.source_files  = "LQKMVVMKit", "OCMVVMDemo/LQKMVVMKit/**/*.{h,m}"

  s.frameworks = "UIKit", "Foundation"

  s.requires_arc = true

  s.dependency 'AFNetworking', '~> 3.1.0'

end
