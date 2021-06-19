Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "UITapableLabelView"
s.summary = "UITapableLabelView lets an ios Developer clicks on uilabel words with ease"
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE.md" }

# 4 - Replace with your name and e-mail address
s.author = { "Ali Maher" => "ali.maheir@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/Ali0Maher/UITapableLabelView"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/Ali0Maher/UITapableLabelView.git", 
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"

# 8
spec.source_files  = "Classes", "Classes/**/*.{h,m}"
spec.exclude_files = "Classes/Exclude"
# 9
#s.resources = "UITapableLabelView/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "4.2"

end