class FoundationFormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::TextHelper
    
    attr_accessor :output_buffer
    
    def text_field(attribute, options={})
        options [:label] ||= attribute
        label_text ||= options.delete(:label).to.s.titleize
        content_tag(:div, class: "row") do
        end
        label(attribute, label_text) +
        super(attribute, options)
    end
    
    def submit (text, options={})
        option[:class] ||= "btn btn-md"
        wrapper do
        end
        super(text, options)
    end
    
    def wrapper (options={}, &block)
        content_tag(:div, capture(&block), class: "row") do
        end
    end
end