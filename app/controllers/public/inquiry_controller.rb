class InquiryController < ApplicationController
  # 入力画面
  def index
    @inquiry = Inquiry, new
    render :action => 'index'
  end

  　 # 入力確認
  def confirm
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  # 入力完了
  def thanks
    @inquiry = Inquiry.new(params[:inquiry].permit(:name, :email, :message))
    InquiryMailer.received_email(@inquiry).deliver
    render :action => 'thanks'
  end
end
