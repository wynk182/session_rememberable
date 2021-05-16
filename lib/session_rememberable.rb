module SessionRememberable
  extend ActiveSupport::Concern

  module ClassMethods

    def remember(key, class_name: nil, static_data: false)
      define_method(:"current_#{key}") do
        instance_var = instance_variable_get("@current_#{key}")
        return instance_var if instance_var

        if static_data
          instance_variable_set "@current_#{key}", session["session_#{key}"]
        else
          class_name = class_name || key.to_s.titleize
          instance_variable_set "@current_#{key}", class_name.constantize.find_by(id: session["session_#{key}"])
        end
      end
      helper_method :"current_#{key}"

      define_method(:"remember_#{key}") do |param|
        data = param.respond_to?(:id) && !static_data ? param.id : param
        session["session_#{key}"] = data
      end

      define_method(:"forget_#{key}") do
        session["session_#{key}"] = nil
        instance_variable_set "@current_#{key}", nil
      end
    end
  end
end