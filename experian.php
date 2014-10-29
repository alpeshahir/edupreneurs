<?php
// https://gist.github.com/johnkary/7782110
// http://www.blogs.zeenor.com/it/php-soap-send-xml-parameter-instead-of-array-associative-array.html

class Authentication {
    function Authentication() {
        $this->Username = "edudo_test";
        $this->Password = "Marthad0g";
    }
}

class Name {
    function Name() {
        $this->Forename = "Mark";
        $this->Surname = "Irving";
    }
}

class Person {
    function Person() {
        $this->name = new Name();
        $this->Gender = "M";
        $this->DateOfBirth = "1988-04-26";
    }
}

class Address {
    function Address() {

    }
}

class SearchOptions {
    function SearchOptions() {
        $this->ProductCode = "ProveID_KYC";
    }
}

class Search {
    function Search() {
        $this->Authentication = new Authentication();
        $this->CountryCode = "GBR";
        $this->Person = new Person();
        $this->Addresses = new Address();
        $this->SearchOptions = new SearchOptions();
    }
}

$url = "https://xml.proveid.experian.com/IDSearch.cfc?wsdl";
// $url = "http://www.webservicex.com/globalweather.asmx?wsdl";
$client = new SoapClient($url, array('trace' => true));

echo "<pre>";

// $search = [
//     "Authentication" => [
//         "Username" => "edudo_test",
//         "Password" => "Marthad0g"
//     ],
//     "CountryCode" => "GBR",
//     "Person" => [
//         "Name" => [
//             "Forename" => "Mark",
//             "Surname" => "Irving"
//         ],
//         "Gender" => "M",
//         "DateOfBirth" => "1988-04-26"
//     ],
//     "Addresses" => [
//         "Address" => [
//             "_" => [
//                 "Premise" => "54 Norwich Street Dereham Norfolk",
//                 "Postcode" => "NR191AD",
//                 "CountryCode" => "GBR"
//             ],
//             "Current" => "1"
//         ]
//     ],
//     "SearchOptions" => [
//         "ProductCode" => "ProveID_KYC"
//     ]
// ];

// $search = new Search();
$search = '<Authentication><Username>edudo_test</Username><Password>Marthad0g</Password></Authentication><CountryCode>GBR</CountryCode><Person><Name><Forename>Mark</Forename><Surname>Irving</Surname></Name><DateOfBirth>1988-04-26</DateOfBirth><Gender>M</Gender></Person><Addresses><Address Current="1"><Premise>54 Norwich Street Dereham Norfolk</Premise><Postcode>NR191AD</Postcode><CountryCode>GBR</CountryCode></Address></Addresses><Passport><PassportNumber></PassportNumber></Passport><DriverLicence><DriverLicenceNumber></DriverLicenceNumber></DriverLicence><SearchOptions><ProductCode>ProveID_KYC</ProductCode></SearchOptions>'
$params = new SoapVar($search, XSD_ANYXML, null, null, null);
print_r($params);

$response = $client->search(new SoapParam($params, 'Search'));

print_r("<hr/>");
print_r("<b>Request Headers:</b>" . "<br/>" . $client->__getLastRequestHeaders() . "<hr/>");
print_r("<b>Request Data:</b>" . "<br/>" . htmlentities($client->__getLastRequest()) . "<hr/>");
print_r("<b>Response Headers:</b>" . "<br/>" . $client->__getLastResponseHeaders() . "<hr/>");
print_r("<b>Response Data:</b>" . "<br/>" . htmlentities($client->__getLastResponse()) . "<hr/>");

// print_r($response);