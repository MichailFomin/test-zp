<?php
/**
 * Created by PhpStorm.
 * User: NOTEBOOK
 * Date: 05.04.2020
 * Time: 15:45
 */

class Model_Login extends Model
{
	public function get_admin_data()
	{

		$array = file('login.txt');

		return array(
				'login' => $array[0],
				'password' => $array[1],
		);
	}
}
