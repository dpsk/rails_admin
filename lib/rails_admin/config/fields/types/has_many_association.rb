require 'rails_admin/config/fields/association'

module RailsAdmin
  module Config
    module Fields
      module Types
        class HasManyAssociation < RailsAdmin::Config::Fields::Association
          # Register field type for the type loader
          RailsAdmin::Config::Fields::Types::register(self)

          # Accessor for field's help text displayed below input field.
          register_instance_option :help do
            ""
          end

          register_instance_option :partial do
            nested_form ? :form_nested_many : :form_filtering_multiselect
          end

          # orderable associated objects
          register_instance_option :orderable do
            false
          end
          
          def method_name
            nested_form ? "#{super}_attributes" : "#{super.to_s.singularize}_ids" # name_ids
          end

          # Reader for validation errors of the bound object
          def errors
            bindings[:object].errors[name]
          end
        end
      end
    end
  end
end
