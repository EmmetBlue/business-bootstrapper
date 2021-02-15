<?php
	$path = "/var/www/html/condra-cloud";
	$fileServer = "";
	$globalsLocation = "/var/www/html/condra-cloud/globals";
	$apiPath = "/var/www/html/condra-cloud/api";

	$elasticSearchEndpoint = "http://api.emmetblue.ng:9200";

	$options = [
	    "dbconfig"=>[
	        "server"=>"api.emmetblue.ng",
	        "dbprefix"=>"emmetblue-condradb",
	        "password"=>"wue37401Dn><97?!68_045DNWEDh"
	    ],
	    "elasticSearchHost"=>$elasticSearchEndpoint
	];

	$dbOptions = json_decode(file_get_contents("config.json"), true)["db"];