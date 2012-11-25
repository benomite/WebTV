<?php
$items =array();

$currentPath = dirname(__FILE__) . "/includes";
if ($handle = opendir($currentPath)) {
    while (false !== ($entry = readdir($handle))) {
        if($entry != "." && $entry != "..") {
            include_once($currentPath . "/" . $entry);
        }
    }
    closedir($handle);
}

$items = array_merge($items, array(
    // uncomment the following to define a path alias
    // Yii::setPathOfAlias('local','path/to/local-folder');

    // This is the main Web application configuration. Any writable
    // CWebApplication properties can be configured here.


    'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
    'name'=>'weexbeTV',
    'theme' => 'webTV_1',
    'language' => 'fr',

    // preloading 'log' component
    'preload'=>array(
        'log',
        'bootstrap', // preload the bootstrap component
    ),

    // autoloading model and component classes
    'import'=>array(
        'application.models.*',
        'application.components.*',
        // user module
        'application.modules.user.models.*',
        'application.modules.user.components.*',
    ),

    'modules'=>array(
        // uncomment the following to enable the Gii tool

        'gii'=>array(
            'class'=>'system.gii.GiiModule',
            'password'=>'CKilPapou?',
            // If removed, Gii defaults to localhost only. Edit carefully to taste.
            'ipFilters'=>array('127.0.0.1','::1'),
            'generatorPaths'=>array(
                'bootstrap.gii',
            ),
        ),
        'user'=>array(
            'hash' => 'md5',   // encrypting method (php hash function)
            'sendActivationMail' => true,    // send activation email
            'loginNotActiv' => false,   // allow access for non-activated users
            'activeAfterRegister' => false, // activate user on registration (only sendActivationMail = false)
            'autoLogin' => true,    // automatically login from registration
            'registrationUrl' => array('/user/registration'),    // registration path
            'recoveryUrl' => array('/user/recovery'),   // recovery password path
            'loginUrl' => array('/user/login'), // login form path
            'returnUrl' => array('/user/profile'),  // page after login
            'returnLogoutUrl' => array('/user/login'),  // page after logout
        ),
        'dash' => array(),
    ),

    // application components
    'components'=>array(
        'bootstrap'=>array(
            'class'=>'ext.bootstrap.components.Bootstrap', // assuming you extracted bootstrap under extensions
        ),
        'image'=>array(
            'class'=>'ext.imageapi.CImage',
            'presets'=>array(
                'main'=>array(
                    'cacheIn'=>'webroot.repository.main',
                    'actions'=>array(
                        'scaleAndCrop'=>array('width'=>440, 'height'=>300),
                    ),
                ),
                'big_thumb'=>array(
                    'cacheIn'=>'webroot.repository.big_thumb',
                    'actions'=>array(
                        'scaleAndCrop'=>array('width'=>220, 'height'=>160),
                    ),
                ),
            ),
        ),
        'user'=>array(
            // enable cookie-based authentication
            'class' => 'WebUser',
            'allowAutoLogin'=>true,
            'loginUrl' => array('/user/login'),
        ),
        // uncomment the following to enable URLs in path-format
        'urlManager'=>array(
            'urlFormat'=>'path',
            'rules'=>array(
                '<controller:\w+>/<id:\d+>'=>'<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
                '<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
            ),
        ),
        // MySQL database(s)
        /*'db'=>array(
            'connectionString' => 'mysql:host=localhost;dbname=webTV',
            'emulatePrepare' => true,
            'username' => 'webTV',
            'password' => 'webTV',
            'charset' => 'utf8',
            'tablePrefix' => '',
        ),*/
        'db'=>array(
            'connectionString' => 'mysql:host=88.165.166.50;dbname=weexbeTV',
            'emulatePrepare' => true,
            'username' => 'weexbeTV',
            'password' => 'weexbeTV!',
            'charset' => 'utf8',
            'tablePrefix' => '',
        ),
        'errorHandler'=>array(
            // use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
        'log'=>array(
            'class'=>'CLogRouter',
            'routes'=>array(
                array(
                    'class'=>'CFileLogRoute',
                    'levels'=>'error, warning',
                ),
                // uncomment the following to show log messages on web pages
                /*
                array(
                    'class'=>'CWebLogRoute',
                ),
                */
            ),
        ),
        'cache' => array(
            'class' => 'system.caching.CDummyCache'
        ),
    ),

    // application-level parameters that can be accessed
    // using Yii::app()->params['paramName']
    'params'=>array(
        // this is used in contact page
        'adminEmail'=>'benoit.osterberger@gmail.com',
    ),
));

return $items;