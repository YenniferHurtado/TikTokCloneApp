platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

# Pods for TikTokApp

target 'TikTokApp' do
  pod 'FirebaseAuth'
  pod 'FirebaseStorage'
  pod 'FirebaseDatabase'
  pod 'FirebaseCore'
  pod 'FirebaseAnalytics'

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = 11.0
     config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
     end
  end
 end
end
