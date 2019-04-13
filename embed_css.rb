# frozen_string_literal: true

# embed_css / https://www.notion.so/highereducation/embed_css-82972efe686a4030bb303bfc5941d183
# Takes the src param value, grabs the style content associated within the source file, and injects the styles within a style tag on the page.
# {% embed_css src:public_path_to_your_css_file %}

require 'open-uri'

module Jekyll
  class EmbedCSS < Liquid::Tag
    include Liquid::StandardFilters

    # Initialize
    def initialize(tag, markup, tokens)
      @markup = markup
      @tag    = tag
      super
    end

    # Get CSS
    def getCSS(variables)
      # Return if no src
      return '/* {embed_css: src property is empty.} */' if variables['src'].nil? || variables['src'].empty?

      # Site Source Path
      css_file = Jekyll.sanitized_path(variables['site']['source'], variables['src'])

      # Exception Handling for Get Ranking Properties
      begin
        css_doc = File.open(css_file).read
      rescue StandardError
        css_doc = '/* {embed_css: src does not exist} */'
      end

      # Return
      css_doc
    end

    # Render
    def render(context)
      variables = get_properties(context, @tag, @markup)
      '<style>' + getCSS(variables) + '</style>'
    end
  end
end

Liquid::Template.register_tag('embed_css', Jekyll::EmbedCSS)
