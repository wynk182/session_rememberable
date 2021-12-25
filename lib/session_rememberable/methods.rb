module SessionRememberable
  extend ActiveSupport::Concern

  module ClassMethods
    def remember(key, class_name: nil, static_data: false)
      define_method(:"current_#{key}") do
        instance_var = instance_variable_get("@current_#{key}")
        return instance_var if instance_var

        if static_data
          instance_variable_set "@current_#{key}", session["current_#{key}"]
        else
          class_name ||= key.to_s.titleize
          instance_variable_set "@current_#{key}", class_name.constantize.find_by(id: session["current_#{key}"])
        end
      end
      helper_method :"current_#{key}"
    end
  end

  def remember(object, name=nil)
    key = "current_#{name || object.class}".downcase
    data = object.respond_to?(:id) ? object.id : object.to_s
    session[key] = data
    instance_variable_set "@#{key}", object
  end

  def forget(object, name=nil)
    key = "current_#{name || object.class}".downcase
    session[key] = nil
    instance_variable_set "@#{key}", nil
  end
end
