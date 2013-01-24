# encoding: utf-8

module EvilFront::Helpers
  # Add content from `head_content` and statistics counter in production,
  # if you set `:stats` option.
  #
  #   html
  #     head
  #       = head_tag do
  #         = title_tag(t.title)
  #         = standard_assets
  def head_tag(&block)
    head_content(&block) if block_given?

    head  = tag(:meta, charset: 'UTF-8')
    head += content_for(:evil_front_head)

    if Rails.env.production?
      head += render('layouts/statistics') rescue ''
    end

    content_tag(:head, head)
  end
end