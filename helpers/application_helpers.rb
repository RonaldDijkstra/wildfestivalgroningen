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
end
