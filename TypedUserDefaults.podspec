Pod::Spec.new do |s|
  s.name             = "TypedUserDefaults"
  s.version          = "1.4"
  s.summary          = "Strictly typed NSUserDefaults, in Swift"

  s.description      = <<-DESC
  With a strictly typed language like Swift, you'd like to make everything as strictly typed as possible. Here, this is a simple hack for UserDefaults.
                       DESC

  s.homepage         = "https://github.com/nh7a/TypedUserDefaults"
  s.license          = 'MIT'
  s.source       = { :git => "https://github.com/capehq/TypedUserDefaults.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc = true

  s.source_files = 'TypedUserDefaults/*.swift'

end
