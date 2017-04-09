# Uncomment the next line to define a global platform for your project
# platform :ios, ’10.0’

def rx_swift
    pod 'RxSwift', '~> 3.0'
end

def rx_cocoa
    pod 'RxCocoa', '~> 3.0'
end

def test_pods
    pod 'RxTest', '~> 3.0'
    pod 'RxBlocking', '~> 3.0'
    pod 'Nimble'
end


target 'Tasks' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_cocoa
    rx_swift
    pod 'QueryKit'
    
end


target 'Domain' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    
end

target 'RealmPlatform' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    pod 'RxRealm'
    pod 'QueryKit'
    pod 'RealmSwift'
    pod 'Realm'
end
