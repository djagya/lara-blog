<?php

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

//Request::setTrustedProxies(array('127.0.0.1'));

$app->get('/', function () {
    return 'works 1';
});
$app->get('/api/', function () {
    return 'works 2';
});
$app->get('/api/contact', function () {
   return 'works';
});

$app->post('/api/contact/webhook', function (Request $request) use ($app) {
    $app['monolog']->info(print_r($request->request->all(), true));

    //    mail('danil.kabluk.backup@gmail.com', '[YourSite] Feedback', 'New message');

    return '';
});

$app->error(function (\Exception $e, Request $request, $code) use ($app) {
    if ($app['debug']) {
        return;
    }

    return new Response('', $code);
});
