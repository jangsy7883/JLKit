Pod::Spec.new do |s|
    s.name            = "JLKit"
    s.version         = "0.2.92"
    s.license         = { :type => 'MIT', :file => 'LICENSE' }
    s.summary         = "JLKit"
    s.homepage        = "https://github.com/jangsy7883/JLKit"
    s.author          = { "hmhv" => "jangsy7883@gmail.com" }
    s.source          = { :git => "https://github.com/jangsy7883/JLKit.git", :tag => s.version }
    s.platform        = :ios, '8.0'
    s.requires_arc    = true
    s.default_subspec = 'Core'

    s.subspec 'Core' do |core|
    core.dependency 'JLKit/Additions'
    core.dependency 'JLKit/StatusBarStyle'
    end

    s.subspec 'Additions' do |sp|
    sp.source_files = 'JLKit/JLKit.h','JLKit/JLKitDefine.h','JLKit/Additions/Foundation/*.{h,m}','JLKit/Additions/UIKit/*.{h,m}'
    end

    s.subspec 'StatusBarStyle' do |ssp|
    ssp.source_files = 'JLKit/Additions/StatusBarStyle/*.{h,m}'
    end
end
