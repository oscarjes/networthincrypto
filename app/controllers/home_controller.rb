class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
  end

  def thanks
  end

  def confirmed
  end

  def about
  end

  def calculate

    crypto_value_usd = 0

    response = HTTParty.get("https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP,BCH,LTC,DASH,XEM,NEO,IOT,XMR&tsyms=USD")

    if params[:btc]
      btc_response = response["BTC"]
      btc_price = btc_response["USD"]
      btc = params[:btc].to_i
      btc_in_usd = btc * btc_price
      crypto_value_usd += btc_in_usd
    end

    if params[:eth]
      eth_response = response["ETH"]
      eth_price = eth_response["USD"]
      eth = params[:eth].to_i
      eth_in_usd = eth * eth_price
      crypto_value_usd += eth_in_usd
    end

    if params[:xrp]
      xrp_response = response["XRP"]
      xrp_price = xrp_response["USD"]
      xrp = params[:xrp].to_i
      xrp_in_usd = xrp * xrp_price
      crypto_value_usd += xrp_in_usd
    end

    if params[:bch]
      bch_response = response["BCH"]
      bch_price = bch_response["USD"]
      bch = params[:bch].to_i
      bch_in_usd = bch * bch_price
      crypto_value_usd += bch_in_usd
    end

    if params[:ltc]
      ltc_response = response["LTC"]
      ltc_price = ltc_response["USD"]
      ltc = params[:ltc].to_i
      ltc_in_usd = ltc * ltc_price
      crypto_value_usd += ltc_in_usd
    end

    if params[:dash]
      dash_response = response["DASH"]
      dash_price = dash_response["USD"]
      dash = params[:dash].to_i
      dash_in_usd = dash * dash_price
      crypto_value_usd += dash_in_usd
    end

    if params[:xem]
      xem_response = response["XEM"]
      xem_price = xem_response["USD"]
      xem = params[:xem].to_i
      xem_in_usd = xem * xem_price
      crypto_value_usd += xem_in_usd
    end

    if params[:neo]
      neo_response = response["NEO"]
      neo_price = neo_response["USD"]
      neo = params[:neo].to_i
      neo_in_usd = neo * neo_price
      crypto_value_usd += neo_in_usd
    end

    if params[:iot]
      iot_response = response["IOT"]
      iot_price = iot_response["USD"]
      iot = params[:iot].to_i
      iot_in_usd = iot * iot_price
      crypto_value_usd += iot_in_usd
    end

    if params[:xmr]
      xmr_response = response["XMR"]
      xmr_price = xmr_response["USD"]
      xmr = params[:xmr].to_i
      xmr_in_usd = xmr * xmr_price
      crypto_value_usd += xmr_in_usd
    end

    networth = params[:usd].to_i
    
    final = crypto_value_usd  / (crypto_value_usd + networth)
    @final = final * 100

    if @final < 10
      @message = "Do you even crypto, bro? You'll never get a lambo this way 😞."
    elsif @final < 20
      @message = "You gotta pump those numbers up… those are rookie numbers! 👶"
    elsif @final < 40
      @message = "It’s a start… but let’s be honest: do you REALLY need that retirement account when you could put it all into crypto 📈?"
    elsif @final < 60
      @message = "Not bad. Have you picked a color for your future lambo yet 🤑?"
    elsif @final < 80
      @message = "Baller 🍾. Time to start thinking about which sports team you'll buy ⚽ 🏈."
    else
      @message = "To the moon 🚀! You’ll be joining the three commas club in no time."
    end
  end
end
