require 'pry'
require 'json'
class Parse

  attr_reader :json

  def initialize()
    @json = JSON.parse(File.read("canvs_tweet_data.json"))
    # binding.pry

  end

  def tweet_parser
    tweet_hash = {}
    index = 0


    json.each do |tweet|
      screen_name = tweet['user']['screen_name']
      tweet_hash[screen_name] ||= 0
      tweet_hash[screen_name] += 1
    end

    top_five = tweet_hash.sort_by{|name, count| count}.reverse.slice(0,5)
    # binding.pry

      top_five.each do |name_n_tweets|
        puts "#{name_n_tweets[0]}, #{name_n_tweets[1]}"
      end

  end

end

parse = Parse.new

parse.tweet_parser
