<?php
$server = new swoole_websocket_server("0.0.0.0", 9501);
$server->on('open', function (swoole_websocket_server $server, $request) {
		echo "server: handshake success with fd{$request->fd}\n";
	});
$server->on('message', function (swoole_websocket_server $server, $frame) {
		echo "receive from {$frame->fd}:{$frame->data},opcode:{$frame->opcode},fin:{$frame->finish}\n";
		$server->push($frame->fd, "this is server");
	});
$server->on('close', function ($ser, $fd) {
		echo "client {$fd} closed\n";
	});
$server->on('request', function (swoole_http_request $request, swoole_http_response $response) {
		global $server;//调用外部的server
		// $server->connections 遍历所有websocket连接用户的fd，给所有用户推送
		foreach ($server->connections as $fd) {
			$server->push($fd, $request->get['message']);
		}
	});
$server->start();
