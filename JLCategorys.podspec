@version = "0.2.32"
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
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
   core.source_files = 'JLCategorys/Foundation/*.{h,m}','JLCategorys/UI/*.{h,m}'
end

  s.subspec 'StatusBarStyle' do |nsudp|
   nsudp.dependency 'JLCategorys/Core'
   nsudp.source_files = 'JLCategorys/StatusBarStyle/*.{h,m}'
end