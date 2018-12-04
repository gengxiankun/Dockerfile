<?php
$server = new swoole_server("127.0.0.1", 9502);
$server->set(array('task_worker_num' => 4));
$server->on('receive', function($server, $fd, $reactor_id, $data) {
    $task_id = $server->task("Async");
    echo "Dispath AsyncTask: [id=$task_id]\n";
});
$server->on('task', function ($server, $task_id, $reactor_id, $data) {
    echo "New AsyncTask[id=$task_id]\n";
    $server->finish("$data -> OK");
});
$server->on('finish', function ($server, $task_id, $data) {
    echo "AsyncTask[$task_id] finished: {$data}\n";
});
$server->start();