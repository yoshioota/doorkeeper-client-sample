# coding: utf-8

# ローカル環境独自の設定値をここに入れることが出来ます。
# 使用する場合は zzzz_local_settings.rb へリネームしてご利用下さい。

# rails foot note
if defined?(Footnotes)
  Footnotes.run!
  Footnotes::Filter.prefix = 'x-mine://open?file=%s&line=%d'
end

if defined?(BetterErrors)
  BetterErrors.editor = 'x-mine://open?file=%{file}&line=%{line}'
end

if Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener
end
