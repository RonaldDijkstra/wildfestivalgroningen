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

  # Get the website name from site.yml
  def website_name
    data.site.name
  end

  # Get the title from frontmatter if any
  def frontmatter_title
    current_page.data.title
  end

  # If there's a title in frontmatter check if it's localized
  # and then join them with the website_name
  def local_title
    if frontmatter_title.is_a?(Hash) && frontmatter_title[I18n.locale]
      [frontmatter_title.send(I18n.locale), website_name].join(" - ")
    elsif frontmatter_title
      [frontmatter_title, website_name].join(" - ")
    end
  end

  # Page title is localized or title
  def page_title
    local_title || website_name
  end

  # Description is the value for description in frontmatter data
  # or the default value defined in site.yml
  def description
    current_page.data.description || t("site.description")
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

  # Robots is current page data or default
  def robots
    current_page.data.robots || "noydir,noodp,index,follow"
  end

  # Make custom page classes that don't translate from target_resource.path
  # Now we can target these pages with a single styling
  def page_classes
    path = current_resource.target_resource.path
    classes = super(path.gsub("localizable", ""))
    classes.prepend("#{I18n.locale} ")
  end

  # Get full url
  def full_url(url, locale = I18n.locale)
    base = "http://#{I18n.t('CNAME', locale: locale)}"
    URI.join(base, url).to_s
  end
end
