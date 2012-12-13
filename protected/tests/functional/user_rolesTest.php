<?php

class user_rolesTest extends WebTestCase
{
	public $fixtures=array(
		'user_roles'=>'user_roles',
	);

	public function testShow()
	{
		$this->open('?r=user_roles/view&id=1');
	}

	public function testCreate()
	{
		$this->open('?r=user_roles/create');
	}

	public function testUpdate()
	{
		$this->open('?r=user_roles/update&id=1');
	}

	public function testDelete()
	{
		$this->open('?r=user_roles/view&id=1');
	}

	public function testList()
	{
		$this->open('?r=user_roles/index');
	}

	public function testAdmin()
	{
		$this->open('?r=user_roles/admin');
	}
}
