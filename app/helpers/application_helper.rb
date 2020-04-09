module ApplicationHelper
  def link_to_add_row(name, form, association, nested, **args)
    if name <=> 'Add Option' then
      #Make a new question_option object
      new_object = form.object.send(association).klass.new
    else
      new_object = form.object.send(association).klass.new
    end
    id = new_object.object_id
    puts 'HEY THERE SHITTY CODER'
    puts form
    puts form.object
    puts form.object.send(association)
    puts form.object.send(association).klass
    puts form.object.send(association).klass.new
    puts new_object
    puts id
    puts 'BYE SHITTY CODER'
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, form: builder)
    end
    if nested == true then
      link_to(name, '#', class: "add_nested_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
    else
      link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
    end
  end
end
