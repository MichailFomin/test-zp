<?php
/**
 * Created by PhpStorm.
 * User: NOTEBOOK
 * Date: 04.04.2020
 * Time: 18:13
 */

class Controller_Index extends Controller
{

	function __construct()
	{
		session_start();
		$this->model = new Model_Index();
		$this->view = new View();
		$this->request = new Request();
	}

	function action_index()
	{
		$request_get = $this->request->get;
		$data['session'] = $_SESSION;
		$data['request'] = $request_get;
		$data['server'] = $this->request->server;

		$this->view->generate('index_view.php', 'template_view.php', $data);
	}

	function redirect($link)  //Перенаправляем на страничку
	{
		header("Location: $link");
		exit;
	}



}
