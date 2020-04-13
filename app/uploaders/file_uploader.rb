# frozen_string_literal: true

class FileUploader < CarrierWave::Uploader::Base
  after :store, :delete_old_tmp_file

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.attachable_type.to_s.underscore}/"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  def filename
    return if original_filename.nil?

    "#{model.attachable.id}.#{content_type.split('/')[-1]}"
  end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w[jpg jpeg pdf]
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def move_to_cache
    true
  end

  def move_to_store
    true
  end

  def cache!(new_file)
    super
    @old_tmp_file = new_file
  end

  def delete_old_tmp_file(_dummy)
    @old_tmp_file.try :delete
  end

  protected

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end
