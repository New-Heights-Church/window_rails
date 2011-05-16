module WindowRailsView
  
  # name:: Name of the link
  # options:: Hash of options values.
  # Creates a link to a window. Content is defined by a url in the options hash using :url or :iframe. 
  # If :url is used, the content is loaded into the window within the page. If :iframe is used
  # the content is loaded into the window within an IFrame on the page. Generally, if you are calling
  # a method that simply renders out a partial, you want to use :url. If you are calling something
  # that returns an entire page, :iframe will likely be the ticket.
  def link_to_window(name, options={}, html_opts={})
    window_url = options[:url] ? url_for(options.delete(:url)) : nil
    options[:iframe] = options.delete(:iframe_url) if options[:iframe_url]
    link_to_remote(
      name, {
      :url => open_window_url(
        :window_url => window_url,
        :window_options => options
      )},
      html_opts
    )
  end
  
end
