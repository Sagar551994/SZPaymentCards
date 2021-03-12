#
# Be sure to run `pod lib lint SZPaymentCards.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SZPaymentCards'
  s.version          = '1.0.0'
  s.summary          = 'SZPaymentCards is SwiftUI framework'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'SZPaymentCards is lightweight SwiftUI framework,  that allows to create deffrent deffrent type of payment card like VisaCard, MasterCard, UnionPay, etc....'

  s.homepage         = 'https://github.com/Sagar551994/SZPaymentCards'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sagar551994' => 'sagar.zalavadiya5@gmail.com' }
  s.source           = { :git => 'https://github.com/Sagar551994/SZPaymentCards.git', :tag => s.version.to_s }
  s.social_media_url   = "https://www.instagram.com/mr.iosdeveloper"

  s.swift_version = '5.0'
  s.platforms = {
      "ios": "14.0"
  }

  s.ios.deployment_target = '14.0'

  s.source_files = 'SZPaymentCards/Classes/**/*'
  
  s.resource_bundles = {
    'SZPaymentCards' => ['SZPaymentCards/Images.xcassets']
  }
   
   

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
