# encoding: utf-8
#require 'carrierwave/processing/mime_types'

class FileUploader < CarrierWave::Uploader::Base

	# Include RMagick or MiniMagick support:
	# include CarrierWave::RMagick
	# include CarrierWave::MiniMagick

	include CarrierWave::MimeTypes
	process :set_content_type

	# Choose what kind of storage to use for this uploader:
	#storage :aws
	storage :file

	# Override the directory where uploaded files will be stored.
	# This is a sensible default for uploaders that are meant to be mounted:
	def store_dir
		"uploads/#{model.class.to_s.underscore}/#{model.number}"
	end

	# Provide a default URL as a default if there hasn't been a file uploaded:
	# def default_url
	#   # For Rails 3.1+ asset pipeline compatibility:
	#   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
	#
	#   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
	# end

	# Process files as they are uploaded:
	process :to_pdf, if: :image?

	def to_pdf
		temp_dir  = Rails.root.join('tmp', 'pdf')
		temp_path = temp_dir.join("#{model.number}.pdf")

		FileUtils.mkdir_p(temp_dir)

		pdf = ExpensePdf.new(current_path)

		pdf.render_file(temp_path)

		File.unlink(current_path)
		FileUtils.cp(temp_path, current_path)

		self.file.instance_variable_set(:@content_type, 'application/pdf')
	end

	def filename
		unless original_filename.nil?
			"#{model.number}.pdf"
		end
	end

	# Create different versions of your uploaded files:
	# version :thumb do
	#   process :scale => [50, 50]
	# end

	# Add a white list of extensions which are allowed to be uploaded.
	# For images you might use something like this:
	def extension_white_list
		%w(jpg jpeg gif png pdf)
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

	protected

	def image?(new_file)
		new_file.content_type.include? 'image'
	end

end
