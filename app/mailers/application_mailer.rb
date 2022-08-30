class ApplicationMailer < ActionMailer::Base
  default from:     "メールテスト運営局",
          bcc:      "gdaadcn9483@gmail.com",
          reply_to: "gdaadcn9483@gmail.com"
  layout 'mailer'
end
