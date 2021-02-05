# frozen_string_literal: true
module ComponentsHelper
  def spinner
    content_tag :div, class: "col-md-12" do
      content_tag :div,
        class: "d-flex justify-content-center spinner-center" do
        content_tag :div,
          class: "spinner-border",
          role: "status" do
          content_tag :span, :loading, class: "sr-only"
        end
      end
    end
  end

  def sidebar
    content_tag :div, class: "col-md-3 d-none d-md-block" do
      content_tag :div,
        data: {
          controller: "content-loader",
          "content-loader-sidebar": sidebar_path,
        } do
        spinner
      end
    end
  end

  def title_row(text)
    content_tag :div, class: "row" do
      title text
    end
  end

  def title(text)
    content_tag :div, class: "title" do
      content_tag :span, class: "text" do
        text
      end
    end
  end

  def required_label(f, name, text)
    content_tag :label, for: "#{f.object_name}_#{name}" do
      raw "#{text} <span class='required-fields'>*</span>"
    end
  end

  def required_fields
    content_tag :div, class: "mb-3" do
      content_tag :small do
        '( <span class="required-fields">*</span> )' \
        '<span class="required-fields">' \
          ' Preenchimento obrigatório' \
        '</span>'.html_safe
      end
    end
  end
end
