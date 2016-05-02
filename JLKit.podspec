@version = "0.2.65"
Pod::Spec.new do |s|
    s.name            = "JLKit"
    s.version         = @version
    s.license         = { :type => 'MIT', :file => 'LICENSE' }
    s.summary         = "JLKit"
    s.homepage        = "https://github.com/jangsy7883/JLKit"
    s.author          = { "hmhv" => "jangsy7883@gmail.com" }
    s.source          = { :git => "https://github.com/jangsy7883/JLKit.git", :tag => @version }
    s.platform        = :ios, '7.0'
    s.requires_arc    = true
    s.default_subspec = 'Core'

    s.subspec 'Core' do |core|
    nsudp.dependency 'JLKit/Additions'
    end

    s.subspec 'Additions' do |core|
    core.source_files = 'JLKit/JLKit.h','JLKit/Additions/Foundation/*.{h,m}','JLKit/Additions/UIKit/*.{h,m}'
    end

    s.subspec 'StatusBarStyle' do |nsudp|
    nsudp.dependency 'JLKit/Core'
    nsudp.source_files = 'JLKit/Additions/StatusBarStyle/*.{h,m}'
    end
end