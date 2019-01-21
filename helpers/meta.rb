# frozen_string_literal: true

# Helpers for Meta Data
module Meta
  # Append for page_title
  def website_title
    data.site.name
  end

  # Use frontmatter or fallback for page title
  def page_title(page)
    frontmatter_title = page.data.title
    if frontmatter_title
      if frontmatter_title.is_a?(Hash) && frontmatter_title[I18n.locale]
        [frontmatter_title.send(I18n.locale), website_title].join(" - ")
      else
        [frontmatter_title, website_title].join(" - ")
      end
    else
      website_title
    end
  end
end
