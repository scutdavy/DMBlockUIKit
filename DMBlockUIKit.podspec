Pod::Spec.new do |s|
  s.name         = "DMBlockUIKit"
  s.version      = "1.0.0"
  s.summary      = "simple wrapper for UIAlertview & UIActionSheet to support block based call back."
   s.description  = <<-DESC
I love Blockit, because it show me the power of block.

I hate Blockit, because:

- it crash my app
- it isn't compitable with ios4.3
- it use some magic which I can't understand soon.

So I implement the block based alertView & actionSheet in a simple way. the code is short and clear; even if there is something wrong, the defect should be easy to fix.
                    DESC
  s.homepage     = "https://github.com/scutdavy/DMBlockUIKit"
  s.license      = 'MIT'
  s.author       = { "邢大为" => "scutdavy@qq.com" }
  s.source       = { :git => "https://github.com/scutdavy/DMBlockUIKit.git", :tag => "#{s.version}" }
  s.platform     = :ios, '4.3'
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.requires_arc = true
end
