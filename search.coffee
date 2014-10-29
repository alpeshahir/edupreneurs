"use strict"

sys = require "sys"
https = require "https"
fs = require "fs"
url = require "url"
swig = require "swig"

options =
	host: "xml.proveid.experian.com"
	port: 443
	path: "/IDSearch.cfc?wsdl"
	action: "Search"
	encoding: "utf8"

system =
	auth:
		username: "edudo_test"
		password: "Marthad0g"
	country: "GBR"
	product: "ProveID_KYC"

user =
	forename: "Mark"
	surname: "Irving"
	dob: "1988-04-26"
	gender: "M"
	address:
		premise: "54 Norwich Street Dereham Norfolk"
		postcode: "NR191AD"
		country: "GBR"

console.log "options:", options
console.log "system:", system
console.log "user:", user

# Templating of search.template
template = swig.compileFile "./search.template"
soapXML = template(
	system: system
	user: user
)

console.log "Template:", soapXML

requestOptions =
	host: options.host
	port: options.port
	path: options.path
	method: "POST"
	headers:
		"SOAPAction": options.action
		"Content-Type": "text/xml"

console.log "requestOptions", requestOptions

requestOptions.body = soapXML

doHTTPS = (options, success, error) ->
	req = https.request requestOptions, (res) ->
		console.log "STATUS", res.statusCode
		console.log "HEADERS", res.headers
		data = ""
		res.setEncoding options.encoding

		res.on "error", (err) ->
			error "RESPONSE ERROR: #{err.message}"

		res.on "data", (chunk) ->
			data += chunk

		res.on "end", () ->
			success
				data: data

	req.write options.body

	req.end()

	req.on "error", (err) ->
		error "REQUEST ERROR: #{err.message}"

doHTTPS requestOptions, ((data) ->
	console.log "SUCCESS:", data
	return
), (err) ->
	console.log "ERROR", err
	return