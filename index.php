<?php
require_once __DIR__ . '/vendor/autoload.php';

use RedBean_Facade as ORM;
use Symfony\Component\HttpFoundation\Request;

/** @var Application $app */
$app          = new Silex\Application();
$app['debug'] = true;

/** @var Template Engine $tpl */
$tpl = new Smarty();

/** Database connect */
ORM::setup('sqlite:data/simplenote.sqlite');


/**
 * Home
 * Add new note
 */
$app->get('/', function () use ($tpl) {
    $tpl->display('index.tpl');
    return false;
});

/**
 * Load JSON notes
 */
$app->post('/load.json', function () use ($app) {
    $notes = ORM::findAll('notes', 'ORDER BY publication DESC');
    // print_r($notes);
    $obj = array();
    foreach ($notes as $row) {
        $obj[] = array(
            'id' => $row['id'],
            'fullname' => $row['fullname']
        );
    }
    return $app->json($obj);
});

/**
 * Edit note
 */
$app->get('/edit/{id}', function ($id) use ($tpl) {
    $notes = ORM::load('notes', $id);
    $tpl->assign('row', $notes);
    $tpl->display('edit.tpl');
    return false;
});

/**
 * Action form note
 */
$app->post('/process', function (Request $request) use ($app, $tpl) {

    $id          = (int)$request->get('id');
    $publication = time();

    if ($id != 0) {

        $notes              = ORM::load('notes', $id);
        $notes->fullname    = $request->get('fullname');
        $notes->memo        = $request->get('memo');
        $notes->publication = $publication;
        ORM::store($notes);

        $tpl->assign('row', $notes);
        $tpl->display('edit.tpl');
        return $app->redirect(sprintf('/edit/%d', $id), 301);

    } else {

        $notes              = ORM::dispense('notes');
        $notes->fullname    = $request->get('fullname');
        $notes->memo        = $request->get('memo');
        $notes->publication = $publication;
        ORM::store($notes);

        $tpl->display('index.tpl');
        return $app->redirect('/', 301);
    }
});

/**
 * Delete note
 */
$app->get('/delete/{id}', function ($id) use ($app) {
    $notes = ORM::load('notes', $id);
    ORM::trash($notes);
    return $app->redirect('/', 301);
});

$app->run();