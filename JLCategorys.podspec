@version = "0.0.4"
Pod::Spec.new do |s|
  s.name         = "JLCategorys"
  s.version      = @version
  s.summary      = "JLCategorys"
  s.homepage     = "https://github.com/jangsy7883/JLCategorys"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "hmhv" => "jangsy7883@gmail.com" }
  s.source       = { :git => "https://github.com/jangsy7883/JLCategorys.git", :tag => @version }
  s.source_files = 'JLCategorys/*.{h,m}'
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
end