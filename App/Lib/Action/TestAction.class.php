<?php

class TestAction  extends GlobalAction{
	
	  function _initialize()
    {
        parent::_initialize();
	  
	}
	
	
	public function index(){
		  
		echo build_app_dir();
		
		  $this->display();
		}
	} 

?>