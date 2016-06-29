CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = SiteConfig.find_by(var: 'util.s3_bucket').value.to_s
  config.aws_acl = :public_read
  #config.asset_host = 'http://example.com'
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  config.aws_credentials = {
      access_key_id: SiteConfig['util.s3_access_key_id'],
      secret_access_key: SiteConfig['util.s3_secret_access_key'],
      region: 'eu-central-1',
      endpoint: 'http://s3.eu-central-1.amazonaws.com'
  }
end