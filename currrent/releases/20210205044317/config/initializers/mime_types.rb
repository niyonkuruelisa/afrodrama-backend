# Be sure to restart your server when you modify this file.
require 'mime/types'
# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
Rack::Mime::MIME_TYPES.merge!({
                                  ".ogg"     => "application/ogg",
                                  ".ogx"     => "application/ogg",
                                  ".ogv"     => "video/ogg",
                                  ".oga"     => "audio/ogg",
                                  ".mp4"     => "video/mp4",
                                  ".m4v"     => "video/mp4",
                                  ".mp3"     => "audio/mpeg",
                                  ".m4a"     => "audio/mpeg"
                              })