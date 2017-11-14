Pod::Spec.new do |spec|
  spec.name         =  'RGDependencyInjector'
  spec.version      =  '1.0'
  spec.summary   =  'RGDependencyInjector - lightweight protocol oriented dependency injector!'
  spec.author = {
    'Ritesh Gupta' => 'rg.riteshh@gmail.com'
  }
  spec.license          =  'MIT' 
  spec.homepage         =  'https://github.com/riteshhgupta/RGDependencyInjector'
  spec.source = {
    :git => 'https://github.com/riteshhgupta/RGDependencyInjector.git',
    :tag => '1.0'
  }
  spec.ios.deployment_target = "8.0"
  spec.source_files =  'Source/*.{swift}'
  spec.requires_arc =  true
end
