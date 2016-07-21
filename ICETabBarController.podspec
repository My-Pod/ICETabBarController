Pod::Spec.new do |s|
s.name             = 'ICETabBarController'
s.version          = '1.0.2'
s.summary          = '简单的自定义tabBarController'
s.description      = <<-DESC
TODO: 简单的TabBarController自定义, 自定义继承自Tabbar的类,替代系统的tabbar以实现定制,并不影响系统功能
DESC

s.homepage         = 'https://github.com/My-Pod/ICETabBarController'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'gumengxiao' => 'rare_ice@163.com' }
s.source           = { :git => 'https://github.com/My-Pod/ICETabBarController.git', :tag => s.version.to_s }

s.ios.deployment_target = '7.0'
s.source_files = 'Classes/*.{h,m,xib}'
s.resources = 'Classes/*.{xib}}'
end
