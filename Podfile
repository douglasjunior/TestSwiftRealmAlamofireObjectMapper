platform :ios, '9.0'
use_frameworks!

target 'TestSwiftRealmAlamofireObjectMapper' do 

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