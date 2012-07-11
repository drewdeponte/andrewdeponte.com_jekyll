module Jekyll
  class ArchivePage < Page
    def initialize(site, base, dir, period, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'archive_index.html')

      self.data['period'] = period
      self.data['period_posts'] = posts
      archive_title_prefix = site.config['archive_title_prefix'] || 'Archive: &ldquo;'
      archive_title_suffix = site.config['archive_title_suffix'] || '&rdquo;'
      self.data['title'] = "#{archive_title_prefix}#{period["month"]}-#{period["year"]}#{archive_title_suffix}"
    end
  end
  
  class ArchivePageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'archive_index'
        site.posts.group_by{ |c| {"month" => c.date.month, "year" => c.date.year} }.each do |period, posts|
          archive_dir = File.join(period["year"].to_s(), "%02d" % period["month"].to_s())
          site.pages << ArchivePage.new(site, site.source, archive_dir, period, posts)
        end
      end
    end
  end

  class ArchivesListTag < Liquid::Tag
    safe = true

    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      archives = []
      context.registers[:site].posts.group_by { |c| { "month" => c.date.month, "year" => c.date.year } }.each do |period, posts|
        archives << { :year => period['year'].to_s, :month => '%02d' % period['month'].to_s, :month_num => period['month'], :count => posts.size }
      end

      html = "<div class=\"archives_list\"><h2>Archives</h2>"
      archives.reverse.each do |archive_info|
        html << "<a href=\"/#{archive_info[:year]}/#{archive_info[:month]}\" class=\"archive\"><span class=\"archive_period\">#{Date::MONTHNAMES[archive_info[:month_num]]} #{archive_info[:year]} </span><span class=\"archive_count\">(#{archive_info[:count]})</span></a>"
      end
      html << "</div>"
      return html
    end
  end
end

Liquid::Template.register_tag('archives_list', Jekyll::ArchivesListTag)
