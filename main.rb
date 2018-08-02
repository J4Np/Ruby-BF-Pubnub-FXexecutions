require 'pubnub'

pubnub = Pubnub.new(
    subscribe_key: 'sub-c-52a9ab50-291b-11e5-baaa-0619f8945a4f',
    connect_callback: lambda {|msg| pubnub.publish(channel: 'lightning_executions_FX_BTC_JPY', message: 'Hello from PubNub Ruby SDK!!', http_sync: true)}
)

pubnub.subscribe(channel: 'lightning_executions_FX_BTC_JPY') do |envelope|
    mes = envelope.message

    if mes.size >= 2 then
        puts mes[-1]
    else
        puts mes
    end

end

loop{sleep(10)}