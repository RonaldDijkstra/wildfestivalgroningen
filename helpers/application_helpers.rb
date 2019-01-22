module ApplicationHelpers
  def markdown(contents)
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      fenced_code_blocks: true,
      footnotes: true,
      highlight: true,
      smartypants: true,
      strikethrough: true,
      tables: true,
      with_toc_data: true
    )
    markdown.render(contents)
  end

  # Get the website name from data
  def website_name
    data.site.name
  end

  # Use frontmatter or fallback for page title
  def page_title(page)
    frontmatter_title = page.data.title
    if frontmatter_title
      if frontmatter_title.is_a?(Hash) && frontmatter_title[I18n.locale]
        [frontmatter_title.send(I18n.locale), website_name].join(" - ")
      else
        [frontmatter_title, website_name].join(" - ")
      end
    else
      website_name
    end
  end

  # Description is the value for description in frontmatter data
  # or the default value defined in site.yml
  def description
    current_page.data.description || data.site.description
  end

  # Localized description value
  #
  # description:
  #   nl: "Dit is een beschrijving"
  #   en: "This is a description"
  #
  def localized_description
    description.send(I18n.locale) if description.is_a?(Hash) && description[I18n.locale]
  end

  # Meta description is localized_description or description
  def meta_description
    localized_description || description
  end
end
