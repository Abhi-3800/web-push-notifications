class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json @user, status: :ok
    else
      render json: {errors: @user.errors.full_messages },
                    status: :unprocessable_entity     
    end
  end

  def fcm_push_notification
    require 'fcm'
    fcm_client = FCM.new("AAAAonirXJY:APA91bEGGmqKHFnU9lfu73-dvlNNC8wAlTSlk87LPSUTx9s-DGFR61vWtU98SFOYmfQ7UQlDrn3X5m0u5UlYRCuytYgMA2oRsDAetA4Dbt-tLtK0BMLQR_C2XJ89Va9qZpRmmkZJWXc4") # set your FCM_SERVER_KEY
    options = {notification: 
                { body: 'test message',
                  title: 'new test notification' 
                }
    }
    registration_ids = ["f-Uvm4aFwHkc-qKltzIWrb:APA91bFUDxtjT9zVx0N18pQ6cFc4zh8_g9Ah3PohiAVFfQPC9E-vbGCnvVYxX9oEJArNcxjadbPhglE7jeChBGT3Mpb3-E1Z2wPqv7hGSWeVBuRsIvbju0rzM0O_MYgD61Rng7BlKH-b"]
    #([Array of registration ids up to 1000])
    # Registration ID looks something like: "dAlDYuaPXes:APA91bFEipxfcckxglzRo8N1SmQHqC6g8SWFATWBN9orkwgvTM57kmlFOUYZAmZKb4XGGOOL9wqeYsZHvG7GEgAopVfVupk_gQ2X5Q4Dmf0Cn77nAT6AEJ5jiAQJgJ_LTpC1s64wYBvC"
    registration_ids.each_slice(20) do |registration_id|
      response = fcm_client.send(registration_id, options)
      puts response
    end
  end
end
