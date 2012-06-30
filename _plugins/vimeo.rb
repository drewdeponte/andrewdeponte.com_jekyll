module Jekyll
  class Vimeo < Liquid::Tag
    WIDTH = 680
    HEIGHT = 382

    def initialize(name, id, tokens)
      super
      @id = id
    end

    def render(context)
      %(<iframe width="#{WIDTH}" height="#{HEIGHT}" src="http://player.vimeo.com/video/#{@id}" frameborder="0" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen">useless text to fix fail to render rest of post issue</iframe>)
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::Vimeo)
