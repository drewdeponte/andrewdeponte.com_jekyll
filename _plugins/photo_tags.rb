module Jekyll
  class MediumPhoto < Liquid::Tag
    safe = true

    def initialize(name, args_str, tokens)
      super
      args = args_str.split
      @photo_name = args[0]
      if args.length > 1
        @alignment = args[1]
      else
        @alignment = nil
      end
    end

    def render(context)
      if @alignment
        %(<a href="/images/photos/original/#{@photo_name}"><img src="/images/photos/medium/#{@photo_name}" align="#{@alignment}" /></a>)
      else
        %(<a href="/images/photos/oroginal/#{@photo_name}"><img src="/images/photos/medium/#{@photo_name}" /></a>)
      end
    end
  end
end

Liquid::Template.register_tag('medium_photo', Jekyll::MediumPhoto)
