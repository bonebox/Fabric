Pod::Spec.new do |spec|
  spec.name         = "Fabric"
  spec.version      = "1.1.1"
  spec.summary      = "Fabric by Twitter, Inc."
  spec.homepage     = "https://fabric.io"
  spec.author       = "Twitter"
  spec.license      = { :type => "Copyright", :file => "LICENSE.md" } # from http://fabric.io/terms
  spec.platform     = :ios, "5.0"
  spec.source       = { :git => "https://github.com/zergtmn/Fabric.git", :tag => "v#{spec.version}" }
  spec.requires_arc = true
  spec.default_subspec = "Core"

  spec.subspec "Core" do |core|
    core.vendored_frameworks = "Fabric.framework"
  end

  spec.subspec "Crashlytics" do |crashlytics|
    crashlytics.dependency "Fabric/Core"
    crashlytics.vendored_frameworks = "Crashlytics.framework"
  end

  spec.subspec "MoPub" do |mopub|
    mopub.dependency "Fabric/Core"
    mopub.vendored_frameworks = "MoPub.framework"
    mopub.resource_bundles = { "MoPub" => "MoPub.framework/Resources/MoPub.bundle/*" }
  end

  spec.subspec "Twitter" do |twitter|
    twitter.dependency "Fabric/Core"
    twitter.vendored_frameworks = "TwitterKit.framework"
    twitter.resource_bundles = { "TwitterKitResources" => "TwitterKit.framework/Resources/TwitterKitResources.bundle/*" }
  end
end
