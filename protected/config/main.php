<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
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

        //YUM User modules
        'application.modules.user.models.*',
        'application.modules.role.models.*',
        'application.modules.registration.models.*',
        'application.modules.profile.models.*',
        'application.modules.message.models.*',
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
        'user' => array(
            'passwordRequirements' => array(
                'minLen' => 4,
                //'maxLen' => 16,
            ),
            'adminlayout' => '//layouts/main',
        ),
        'role' => array(),
        'registration' => array(),
        'profile' => array(),
        'message' => array(),
        'avatar' => array(),
	),

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			//'allowAutoLogin'=>true,
            'class' => 'application.modules.user.components.YumWebUser',
            'allowAutoLogin'=>true,
            'loginUrl' => array('//user/user/login'),
		),
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
		// uncomment the following to enable URLs in path-format
		'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		/*
		'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),*/
		// uncomment the following to use a MySQL database
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=webTV',
			'emulatePrepare' => true,
			'username' => 'webTV',
			'password' => 'webTV',
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
);