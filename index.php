<?php declare (strict_types=1);
/**
 * @license MIT
 * @author Samuel Adeshina <samueladeshina73@gmail.com>
 *
 * Business Bootstrapper
 *
 * As the name implies, this script helps set up a new business.
 */
header('Access-Control-Allow-Headers: Content-Type, Cache-Control, X-Requested-With, Authorization');
header('Access-Control-Allow-Methods: POST, OPTIONS');

require_once("configs.php");

if (!isset($_POST["id"])){
    die("please provide a valid business id"); //REFACTOR: poor design practice. Use an exception instead.
}


/*
    REFACTOR

    Why not reuse the same API controller code here and maintain
    persistent configuration collection instead?

    NoSQL???
*/
function initDirectories(string $path, string $id){
    $slash = DIRECTORY_SEPARATOR;
    mkdir($path.$slash."files".$slash.$id.$slash."bin/data/records/archives/patient", 0777, true);
    mkdir($path.$slash."files".$slash.$id.$slash."bin/data/records/archives/staff", 0777, true);

    mkdir($path.$slash."confs".$slash.$slash.$id, 0777, true);
    mkdir($path.$slash."local".$slash.$id, 0777, true);
}

function generateGlobal(string $path, string $id, string $fileServer, string $globalsLocation){
    $slash = DIRECTORY_SEPARATOR;
    $config = json_encode([
        "file-server"=>$fileServer.$slash.$id.$slash,
        "file-server-path"=>$path.$slash."files".$slash.$id.$slash,
        "patient-archive-dir"=> "bin/data/records/archives/patient/",
        "staff-archive-dir"=>"bin/data/records/archives/staff/",
        "patient-es-archive-index"=>"archives_".$id,
        "fpcache-file"=>"",
        "finger-matcher-executable"=>"",
        "finger-match-threshold"=>"30",

        "config-dir"=> [
            "whitelists"=> $path.$slash."confs".$slash.$id.$slash."whitelists.json",
            "database-config"=>$path.$slash."confs".$slash.$id.$slash."database-config.json",
            "elasticsearch-config"=>$path.$slash."confs".$slash.$id.$slash."elasticsearch-config.json",
            "http-headers-config"=>$path.$slash."confs".$slash.$id.$slash."http-headers-config.json",
            "smtp-config"=>$path.$slash."confs".$slash.$id.$slash."smtp-config.json"
        ],

        "session-location"=> $path.$slash."local".$slash.$id.$slash."session",
        "acl-location"=> $path.$slash."local".$slash.$id.$slash."acl"
    ]);

    $filename = $globalsLocation.$slash.$id.".json";

    file_put_contents($filename, $config);
}

function generateConfigs(string $path, string $id, array $options){
    $slash = DIRECTORY_SEPARATOR;

    //database-config.json
    $dbConfig = json_decode(file_get_contents("templates/configs/database-config.json"), true);
    $dbConfig["server"] = $options["dbconfig"]["server"];
    $dbConfig["database"] = $options["dbconfig"]["dbprefix"]."-".$id;
    $dbConfig["password"] = $options["dbconfig"]["password"];

    $dbConfig = json_encode($dbConfig);
    file_put_contents($path.$slash."confs".$slash.$id.$slash."database-config.json", $dbConfig);

    //whitelists
    $whitelists = file_get_contents("templates/configs/whitelists.json");
    file_put_contents($path.$slash."confs".$slash.$id.$slash."whitelists.json", $whitelists);

    //elasticsearch-config
    $elasticsearchConfig = file_get_contents("templates/configs/elasticsearch-config.json");
    $elasticsearchConfig = json_decode($elasticsearchConfig, true);
    $elasticsearchConfig["hosts"][0] = $options["elasticSearchHost"];

    $elasticsearchConfig = json_encode($elasticsearchConfig);
    file_put_contents($path.$slash."confs".$slash.$id.$slash."elasticsearch-config.json", $elasticsearchConfig);

    //http-headers-config
    $httpConfig = file_get_contents("templates/configs/http-headers-config.json");
    file_put_contents($path.$slash."confs".$slash.$id.$slash."http-headers-config.json", $httpConfig);

    //http-headers-config
    $smtpConfig = file_get_contents("templates/configs/smtp-config.json");
    file_put_contents($path.$slash."confs".$slash.$id.$slash."smtp-config.json", $smtpConfig);

    //init-session
    $session = base64_encode(serialize([]));
    file_put_contents($path.$slash."local".$slash.$id.$slash."session", $session);

    //init-acl

    //REFACTOR: WHY? why not generate when needed? same value for every deployment??
    $acl = "TzoxNToiU2Ftc2hhbFxBY2xcQWNsIjo1OntzOjEyOiJyb2xlUmVnaXN0cnkiO086Mjk6IlNhbXNoYWxcQWNsXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoxOntzOjExOiIAKgByZWdpc3RyeSI7YToxOntzOjEzOiJhZG1pbmlzdHJhdG9yIjthOjA6e319fXM6MTk6IgAqAHJlc291cmNlUmVnaXN0cnkiO086Mjk6IlNhbXNoYWxcQWNsXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoxOntzOjExOiIAKgByZWdpc3RyeSI7YTowOnt9fXM6MjE6IgAqAHBlcm1pc3Npb25SZWdpc3RyeSI7TzoyOToiU2Ftc2hhbFxBY2xcUmVnaXN0cnlcUmVnaXN0cnkiOjE6e3M6MTE6IgAqAHJlZ2lzdHJ5IjthOjQ6e3M6NjoiY3JlYXRlIjthOjA6e31zOjQ6ImVkaXQiO2E6MDp7fXM6NjoiZGVsZXRlIjthOjA6e31zOjQ6InZpZXciO2E6MDp7fX19czoxNDoiZ2xvYmFsUmVnaXN0cnkiO086MzU6IlNhbXNoYWxcQWNsXFJlZ2lzdHJ5XEdsb2JhbFJlZ2lzdHJ5IjoxOntzOjExOiIAKgByZWdpc3RyeSI7YTowOnt9fXM6MTA6IgAqAHNlc3Npb24iO2E6MTp7czo1OiJxdWVyeSI7YjoxO319";
    file_put_contents($path.$slash."local".$slash.$id.$slash."acl", $acl);
}

function initDB($dbName, $dbOptions, $username, $password, $firstname, $lastname){
    //get db inits
    $inits = "";
    $dirContents = new \DirectoryIterator("./templates/sql/inits");
    foreach ($dirContents as $content) {
        if ($content->isDot()) continue;

        $inits .= file_get_contents("./templates/sql/inits/".$content->getFilename());
    }

    //install db
    $dbInstallScript = file_get_contents("./templates/sql/db.sql").$inits;
    $dbInstallScript = str_replace("[EmmetBlue]", "[$dbName]", $dbInstallScript);

    $password = password_hash($password, PASSWORD_DEFAULT);
    $uuid = substr(str_shuffle(MD5(microtime())), 0, 20);

    $dbInstallScript = str_replace("[username]", "$username", $dbInstallScript);
    $dbInstallScript = str_replace("[password]", "$password", $dbInstallScript);
    $dbInstallScript = str_replace("[uuid]", "$uuid", $dbInstallScript);
    $dbInstallScript = str_replace("[firstname]", "$firstname", $dbInstallScript);
    $dbInstallScript = str_replace("[lastname]", "$lastname", $dbInstallScript);
    $dbInstallScript = str_replace("[fullname]", "$firstname $lastname", $dbInstallScript);

    $statements = explode("GO", $dbInstallScript);

    $server = $dbOptions["server"];
    $username = $dbOptions["username"];
    $password = $dbOptions["password"];

    $pdo = new \PDO("sqlsrv:Server=$server;Database=master;ConnectionPooling=0", $username, $password);

    $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

    foreach ($statements as $statement){
        if ($statement !== ""){
            try{
                $st = $pdo->prepare($statement);
                $st->execute();
            }
            catch(\Exception $e){
                echo $statement."\n";
            }
        }
    }
}

function downloadApi($apiPath, $id, $globalsLocation){
    $script = "git clone https://github.com/EmmetBlue/Emmet-Blue-Api.git $apiPath/$id/ --single-branch --branch project-condra-dev";
    $out = exec(escapeshellcmd($script), $output);
    $script = "php $apiPath/$id/composer.phar install -d $apiPath/$id/ --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader";
    $out = exec(escapeshellcmd($script), $output);
    $script = "php $apiPath/$id/composer.phar update -d $apiPath/$id/";
    $out = exec(escapeshellcmd($script), $output);

    $globals = ["globals"=>$globalsLocation."/$id"];
    file_put_contents("$apiPath/$id/globals.json", json_encode($globals));
}

function createElasticSearchIndex($esUrl, $id){
    $index = "archives_".$id;
    $url = $esUrl."/".$index;
    $data = array();

    $options = array(
        'http' => array(
            'method'  => 'PUT',
            'content' => http_build_query($data)
        )
    );
    $context  = stream_context_create($options);
    $result = file_get_contents($url, false, $context);

    return $result;
}


$id = (string) $_POST["id"];
$username = $_POST["username"];
$firstname = $_POST["firstname"];
$lastname = $_POST["lastname"];
$password = $_POST["password"];

$responses = [];

$responses[] = initDirectories($path, $id);
$responses[] = generateGlobal($path, $id, $fileServer, $globalsLocation);
$responses[] = generateConfigs($path, $id, $options);
$responses[] = initDB($options["dbconfig"]["dbprefix"]."-".$id, $dbOptions, $username, $password, $firstname, $lastname);
$responses[] = downloadApi($apiPath, $id, $globalsLocation);
// $responses[] = createElasticSearchIndex($elasticSearchEndpoint, $id);

echo json_encode(["status"=>true, "response"=>$responses]);