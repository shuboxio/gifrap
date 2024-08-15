# frozen_string_literal: true

class FeatureObjectGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :steps, type: :array, default: [], banner: 'step_method_one step_method_two'

  def copy_feature_object_file
    template 'feature_object.rb', "spec/support/feature/#{file_name}.rb"
  end
end
