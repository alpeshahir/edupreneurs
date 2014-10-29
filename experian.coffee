"use strict"

js2xml = require "js2xmlparser"

data =
	soap:

	firstname: "Mayur"
	lastname: "Ahir"

console.log js2xml "person", data


# soap = require "easysoap"
# # url = "https://xml.proveid.experian.com/IDSearch.cfc?wsdl"
# # args =
# # 	Search:
# # 		Authentication:
# # 			Username: "edudo_test"
# # 			Password: "Marthad0g"
# # 		CountryCode: "GBR"
# # 		Person:
# # 			Name:
# # 				Forename: "Mark"
# # 				Surname: "Irving"
# # 			DateOfBirth: "1988-04-26"
# # 			Gender: "M"
# # 		Addresses:
# # 			Address:
# # 				attributes:
# # 					Current: 1
# # 				Premise: "54 Norwich Street Dereham Norfolk"
# # 				Postcode: "NR191AD"
# # 				CountryCode: "GBR"
# # 		SearchOptions:
# # 			ProductCode: "ProveID_KYC"

# clientParams =
# 	host: "xml.proveid.experian.com"
# 	path: "/IDSearch.cfc"
# 	wsdl: "?wsdl"

# clientOptions =
# 	secure: true

# SoapClient = new soap.Client(clientParams, clientOptions)
# SoapClient.call(
# 	method: "IDSearch"
# 	params:
# 		test: 2
# 		test1: [
# 			"item1"
# 			"item2"
# 		]
# 		test2:
# 			_attributes:
# 				id: 1

# 		_value: "test1data"
# ).done ((res) ->
# 	console.log "data", res.data # response data as array
# 	console.log "response", res.response # full response data (including xml)
# 	console.log "header", res.header # response header
# 	return
# ), (err) ->
#   console.log err
#   return

# # soap.createClient url, (reqErr, client) ->
# # 	if reqErr
# # 		console.log "reqErr", reqErr
# # 		return

# # 	client["IDSearch"]["IDSearch.cfc"].search args, (respErr, result) ->
# # 		if respErr
# # 			console.log "respErr", respErr
# # 			return

# # 		console.log "Response:", result
# # 		console.log "Request:", client.lastRequest