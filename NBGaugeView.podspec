#
# Be sure to run `pod lib lint NBGaugeView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NBGaugeView'
  s.version          = '0.1.0'
  s.summary          = 'NBGaugeView is a simple and customizable gauge control for iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'NBGaugeView is a simple donut used for displaying text in hollow circle.'

  s.homepage         = 'https://github.com/nikhilbatra789/NBGaugeView'
  # s.screenshots     = 'https://s11.postimg.org/7aax9zv37/Simulator_Screen_Shot_14_Nov_2016_11_34_44_AM.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'NikhilBatra' => 'nikhilbatra789@gmail.com' }
  s.source           = { :git => 'https://github.com/nikhilbatra789/NBGaugeView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NBGaugeView/Classes/**/*'
end
