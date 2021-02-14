class PurchaseRecordsController < ApplicationController
 def index
  @user_purchase_record = UserOrder.new
 end
end
