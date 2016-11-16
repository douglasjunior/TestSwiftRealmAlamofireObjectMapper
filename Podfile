# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'TestSwiftRealmAlamofireObjectMapper' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'RealmSwift', '2.0.3'
  pod 'Alamofire', '3.5.1'
  pod 'AlamofireObjectMapper', '3.0.2'
  pod 'ObjectMapper', '1.5.0' # manter essa versão devido a compatibilidade

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '2.3' # or '3.0'
        end
    end
end