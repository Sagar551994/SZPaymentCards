#
# Be sure to run `pod lib lint SZPaymentCards.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SZPaymentCards'
  s.version          = '1.0.1'
  s.summary          = 'SZPaymentCards is SwiftUI framework'

  s.description      = 'SZPaymentCards is lightweight SwiftUI framework,  that allows to create deffrent deffrent type of payment card like VisaCard, MasterCard, UnionPay, etc....'

  s.homepage         = 'https://github.com/Sagar551994/SZPaymentCards'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sagar551994' => 'sagar.zalavadiya5@gmail.com' }
  s.source           = { :git => 'https://github.com/Sagar551994/SZPaymentCards.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '14.0'

  s.source_files = 'SZPaymentCards/Classes/**/*'
  s.resource_bundles = {
    'SZPaymentCards' => ['SZPaymentCards/Images.xcassets']
  }
  
  s.swift_version = '5.0'
  
end
