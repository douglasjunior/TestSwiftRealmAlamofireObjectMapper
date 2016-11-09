# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TestRealm' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'RealmSwift', '~> 2.0.3'

  # Pods for TestRealm

  target 'TestRealmTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TestRealmUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '2.3' # or '3.0'
        end
    end
end