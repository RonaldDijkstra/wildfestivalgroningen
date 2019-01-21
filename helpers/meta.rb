# frozen_string_literal: true

# Helpers for Meta Data
module Meta
  # Append for page_title
  def append_title
    " - Wildfestival Groningen #WFG"
  end

  # Use frontmatter or fallback for page title
  def page_title(page)
    frontmatter_title = page.data.title
    if frontmatter_title
      if frontmatter_title.is_a?(Hash) && frontmatter_title[I18n.locale]
        frontmatter_title.send(I18n.locale) + append_title
      else
        frontmatter_title + append_title
      end
    else
      "Wildfestival Groningen #WFG"
    end
  end
end
