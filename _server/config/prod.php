<?php

use Silex\Provider\MonologServiceProvider;

/**
 * @var \Silex\Application $app
 */

$app->register(new MonologServiceProvider(), [
    'monolog.logfile' => __DIR__ . '/../var/logs/silex_prod.log',
    'monolog.level' => \Monolog\Logger::INFO,
]);
