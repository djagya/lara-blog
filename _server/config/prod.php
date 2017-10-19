<?php

use Silex\Provider\MonologServiceProvider;

/**
 * @var \Silex\Application $app
 */

$app->register(new MonologServiceProvider(), [
    'monolog.logfile' => __DIR__ . '/../var/logs/silex_dev.log',
]);
