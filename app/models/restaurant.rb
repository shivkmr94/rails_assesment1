class Restaurant < ActiveRecord::Base
  require 'data_fetch/main'

  def self.get_data
  	response = DataFetch::Main.get_restaurents['businesses']
  	data = self.parse_data(response)
  end

  def self.parse_data(response)
  	data = []
		response.each do |d|
			hsh = {}
			hsh = {'restaurant_name' => d['name'],'review_count' => d['reviews'].count}
			hsh['address'] = {}
			hsh['address'] = {'latitude'=> d['latitude'], 'longitude' => d['longitude'], 'city' => d['city'],'state' => d['state'], 'zip'=> d['zip']} 
			hsh['rating'] = d['avg_rating']
			data << hsh
		end
		data = data.present? ? data.sort{|a,b| b['review_count'] <=> a['review_count']} : []
  end

end