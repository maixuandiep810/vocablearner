# Uncomment the next line to define a global platform for your project
# platform :ios, '13.4'

target 'vocablearner' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for vocablearner



    pod 'Alamofire', '~> 4.7'
    pod 'AlamofireObjectMapper', :git => 'https://github.com/RomanPodymov/AlamofireObjectMapper.git', :branch => 'xcode-10-2-fix'
    pod 'JGProgressHUD'
    pod 'RealmSwift'
    pod 'SDWebImage'



  target 'vocablearnerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'vocablearnerUITests' do
    # Pods for testing
  end




  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '5.0'
          end
      end
  end

end
