<?php

class Controller_User extends Controller_Template
{
    public $template = "user/template";

    public function action_index()
    {
	$data["subnav"] = array('index'=> 'active' );
	$this->template->title = 'User &raquo; Index';
	$this->template->content = View::forge('user/index', $data);
    }

    public function action_login()
    {
	$data["subnav"] = array('login'=> 'active' );
	$this->template->title = 'User &raquo; Login';
	$this->template->content = View::forge('user/login', $data);
    }

    public function action_posts()
    {
	$data["subnav"] = array('posts'=> 'active' );
	$this->template->title = 'User &raquo; Posts';
	$this->template->content = View::forge('user/posts', $data);
    }

}
