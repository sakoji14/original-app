class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'gdaadcn9483@gmail.com',
      to:   'takakoji59@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end
end
