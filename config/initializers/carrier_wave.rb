
CarrierWave.configure do |config|
    config.fog_credentials = {
    # Amazon S3 的配置
    :provider              => 'AWS',
    :aws_access_key_id     => 'AKIAJ3DY72MM6C5QB4VA',
    :aws_secret_access_key => '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',
    :region                => 'ap-northeast-1'
    }
    config.fog_directory = "politicalplatform"
end