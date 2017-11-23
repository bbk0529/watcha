require 'httparty'
require 'json'
require 'awesome_print'
require 'rest-client'
require 'csv'

headers = {
		cookie: "__uvt=; _s_guit=f8e29ab43be25368fe8d1aeb46bd2d97b759a256b4065510e3726b27f704; _gat=1; uvts=6m4UIAwswTiQHSqM; _guinness_session=aEgxNnRZdTBaL3NEeEZqN0hVeHFaODZ1TlR4a05mWWpXRG4rZEwvZStUb05YeWJicndSZ0RHOHdyUFdDRWtDNHpzZS9iR1R0anNBcWZ5em1GNENjUi9wNkRHWHBwVTdTWDFlTERzVzI4WjduZXpMeWlhK245aG05Y3pyT0hHQVBTbklyY0tXR2JUcW95VkxZVmNZcjF6b3Z1R2RFZnZUcEZqeTBtYWUrVjVEbCsyOTFMSjBCRXNwczVoYW82VytzLS1JR3c3aUlvd0wxUkYzVllTM1VUZzdRPT0%3D--66cf8b7cc3c801484f2eba1777ca61aaad4001e2; _ga=GA1.2.949273064.1510904452; _gid=GA1.2.567385952.1511238034"
}

res=HTTParty.get(
	'https://watcha.net/boxoffice.json',
	:headers => headers
	)
#Restclient.get()
#res=restClient.get('https://watcha.net/boxoffice.json', headers)
result=JSON.parse(res.body)
#ap(result)
#result['cards'][0]['items'][0]['item']['interesting_comment']['text']
 
movies = {}
result['cards'].each do |card|
	items=card['items'][0]['item'] #breaking point

	title=items['title']
	poster=items['poster']['large']
	comment = items['interesting_comment']['text'] if items['interesting_comment']
	# if items['interesting_comment']!=nil
	# 	comment=items['interesting_comment']['text']
	# else
	# 	comment=''	
	# end 
	# movies[title]={}
	# movies[title]['poster'] = poster
	# movies[title]['comment'] = comment 


	CSV.open("movie_list.csv", "a+") {|csv| csv << [title, poster, comment]}
end 





CSV.open('movie_list.csv','r').each do |csv|
	ap csv
end
