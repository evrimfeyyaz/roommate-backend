class ItemThumbnailUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :two_x do
    process resize_to_fill: [400, 480]
  end

  version :one_x, from_version: :two_x do
    process resize_to_fill: [200, 240]
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
