module ImageHelpers
  # Embed SVG images inline within a Middleman template.
  # ---
  # Adapted from the work of James Martin and Steven Harley.
  # Reference: https://robots.thoughtbot.com/organized-workflow-for-svg
  def inline_svg(filename, **options)
    asset = sprockets.find_asset(filename)
    file = asset.source.force_encoding('UTF-8')
    doc = Nokogiri::HTML::DocumentFragment.parse(file)
    svg = doc.at_css 'svg'
    svg['class'] = options[:class] if options.key?(:class)
    doc
  end
end
